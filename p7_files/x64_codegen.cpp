#include <ostream>
#include "3ac.hpp"

namespace drewgon{

void IRProgram::allocGlobals(){
	//Choose a label for each global
    for(auto g : globals){
        SymOpd * globalOpd = g.second;
        std::string memLoc = "gbl_" ;
        const SemSymbol * sym = globalOpd->getSym();
        memLoc += sym->getName();
        globalOpd->setMemoryLoc("(" + memLoc + ")");
    }
}

void IRProgram::datagenX64(std::ostream& out){
	
    out << ".data\n";
    out << ".globl main\n";
    for(auto g : globals){
        SymOpd * globalOpd = g.second;
        std::string memLoc = "gbl_" ;
        const SemSymbol * sym = globalOpd->getSym();
        memLoc += sym->getName();
        size_t width = sym->getDataType()->getSize();
        if(width != 0) {
            out << memLoc << ":";
        }
        if(width == 8){
            out << " .quad 0\n";

        } 
    }

    int count =strings.size()-1;
    for (auto s: strings) {
        std::string stringVal = s.second;
        std::string memloc = "str_" + to_string(count);
        out << memloc << ": .asciz " << stringVal << "\n";
        count--;
    }
	out << ".align 8\n";

}

void IRProgram::toX64(std::ostream& out){
	allocGlobals();
	datagenX64(out);
	// Iterate over each procedure and codegen it
    out << ".text\n";
    for(auto proc : *this->procs){
        proc->toX64(out);
    }
}

void Procedure::allocLocals(){
	//Allocate space for locals
	// Iterate over each procedure and codegen it
    int count = 0;
	for(auto t : temps ){
        int offset = 24 + (count*8);
        t->setMemoryLoc("-" + to_string(offset) + "(%rbp)");
        count++;
    }
    for(auto t : locals){
        SymOpd* sym = t.second;
        int offset = 24 + (count*8);
        sym->setMemoryLoc("-" + to_string(offset) + "(%rbp)");
        count++;
    }
    for(auto t : formals ){
        int offset = 24 + (count*8);
        t->setMemoryLoc("-" + to_string(offset) + "(%rbp)");
        count++;
    }
    for(auto t : addrOpds ){
        int offset = 24 + (count*8);
        t->setMemoryLoc("-" + to_string(offset) + "(%rbp)");
        count++;
    }   
}

void Procedure::toX64(std::ostream& out){
	//Allocate all locals
	allocLocals();

	enter->codegenLabels(out);
	enter->codegenX64(out);
	out << "#Fn body " << myName << "\n";
	for (auto quad : *bodyQuads){
		quad->codegenLabels(out);
		out << "#" << quad->toString() << "\n";
		quad->codegenX64(out);
	}
	out << "#Fn epilogue " << myName << "\n";
	leave->codegenLabels(out);
	leave->codegenX64(out);
}

void Quad::codegenLabels(std::ostream& out){
	if (labels.empty()){ return; }

	size_t numLabels = labels.size();
	size_t labelIdx = 0;
	for ( Label * label : labels){
		out << label->getName() << ": ";
		if (labelIdx != numLabels - 1){ out << "\n"; }
		labelIdx++;
	}
}

void BinOpQuad::codegenX64(std::ostream& out){
	TODO(Implement me)
}

void UnaryOpQuad::codegenX64(std::ostream& out){
	TODO(Implement me)
}

void AssignQuad::codegenX64(std::ostream& out){
	src->genLoadVal(out, A);
	dst->genStoreVal(out, A);
}

void GotoQuad::codegenX64(std::ostream& out){
	out << "jmp " << tgt->getName() << "\n";
}

void IfzQuad::codegenX64(std::ostream& out){
	TODO(Implement me)
}

void NopQuad::codegenX64(std::ostream& out){
	out << "nop" << "\n";
}

void IntrinsicMayhemQuad::codegenX64(std::ostream& out){
	TODO(Implement me)
}

void IntrinsicOutputQuad::codegenX64(std::ostream& out){
	myArg->genLoadVal(out, DI);
	if (myType->isBool()){
		out << "callq printBool\n";
	} else if (myType->isInt()) {
		out << "callq printInt\n";
	} else {
        out << "callq printString\n";
    }
}

void IntrinsicInputQuad::codegenX64(std::ostream& out){
	TODO(Implement me)
}

void CallQuad::codegenX64(std::ostream& out){
	TODO(Implement me)
}

void EnterQuad::codegenX64(std::ostream& out){
    out << "#Prologue\n";
	out << "pushq %rbp\nmovq %rsp, %rbp\naddq $16, %rbp\n";
    int numLoc = myProc->arSize();
    out << "subq $" << numLoc << ", %rsp\n";
}

void LeaveQuad::codegenX64(std::ostream& out){
    int numLoc = myProc->arSize();
    out << "addq $" << numLoc << ", %rsp\n";
    out << "popq %rbp\n";
    out << "retq\n";
}

void SetArgQuad::codegenX64(std::ostream& out){
	TODO(Implement me)
}

void GetArgQuad::codegenX64(std::ostream& out){
	//We don't actually need to do anything here
}

void SetRetQuad::codegenX64(std::ostream& out){
	TODO(Implement me)
}

void GetRetQuad::codegenX64(std::ostream& out){
	TODO(Implement me)
}

void LocQuad::codegenX64(std::ostream& out){
	TODO(Implement me)
}

void SymOpd::genLoadVal(std::ostream& out, Register reg){
    //FIX ME: Worry about width of operand later
    out << "movq " << this->getMemoryLoc() << ", " << RegUtils::reg64(reg) << "\n"; 
}

void SymOpd::genStoreVal(std::ostream& out, Register reg){
	out << getMovOp() << " " << RegUtils::reg64(reg) << ", " << this->getMemoryLoc() << "\n";
}

void SymOpd::genLoadAddr(std::ostream& out, Register reg) {
	TODO(Implement me if necessary)
}

void AuxOpd::genLoadVal(std::ostream& out, Register reg){
	out << getMovOp() << this->getMemoryLoc() << ", " << getReg(reg) << "\n"; 
}

void AuxOpd::genStoreVal(std::ostream& out, Register reg){
	out << getMovOp() << " " << getReg(reg) << ", " << this->getMemoryLoc() << "\n";
}
void AuxOpd::genLoadAddr(std::ostream& out, Register reg){
	TODO(Implement me)
}


void AddrOpd::genStoreVal(std::ostream& out, Register reg){
	TODO(Implement me)
}

void AddrOpd::genLoadVal(std::ostream& out, Register reg){
	//fix me: worry about size of operand
    out << "movq " << this->getMemoryLoc() << ", " << RegUtils::reg64(reg) << "\n"; 
    TODO(Implement me)
}

void AddrOpd::genStoreAddr(std::ostream& out, Register reg){
	TODO(Implement me)
}

void AddrOpd::genLoadAddr(std::ostream & out, Register reg){
	TODO(Implement me)
}

void LitOpd::genLoadVal(std::ostream & out, Register reg){
	out << getMovOp() << " $" << val << ", " << RegUtils::reg64(reg) << "\n";
}

}
