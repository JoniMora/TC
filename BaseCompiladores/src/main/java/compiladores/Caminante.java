package compiladores;

import compiladores.compiladoresParser.ExpContext;
import compiladores.compiladoresParser.ExpresionContext;
import compiladores.compiladoresParser.FactorContext;
import compiladores.compiladoresParser.ProgramaContext;

public class Caminante extends compiladoresBaseVisitor<String> {

    @Override
    public String visitPrograma(ProgramaContext arg0) {
        // TODO Auto-generated method stub
        System.out.println("Comenzamos a caminar el arbol");
        return super.visitPrograma(arg0);
    }

    @Override
    public String visitExpresion(ExpresionContext arg0) {
        // TODO Auto-generated method stub
        System.out.println("Llegamos a las expresiones");
        return super.visitExpresion(arg0);
    }

    @Override
    public String visitFactor(FactorContext arg0) {
        // TODO Auto-generated method stub
        System.out.println("FACTOR tiene " + arg0.getChildCount() + " hijos - texto " + arg0.getText());
        if (arg0.getChildCount() == 3) {
            System.out.println("Salto a exp");
            return super.visitExp((ExpContext)arg0.getChild(1));
        }
        return super.visitFactor(arg0);
    }

    @Override
    public String visitExp(ExpContext arg0) {
        // TODO Auto-generated method stub
        System.out.println("Llegamos a las exp");
        return super.visitExp(arg0);
    }    
}