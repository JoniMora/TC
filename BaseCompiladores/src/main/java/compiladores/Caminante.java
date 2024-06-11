package compiladores;

import org.antlr.v4.runtime.tree.TerminalNode;
import compiladores.compiladoresParser.AsignacionContext;
import compiladores.compiladoresParser.ProgramaContext;
import compiladores.compiladoresParser.ExpresionContext;
import compiladores.compiladoresParser.FactorContext;
import compiladores.compiladoresParser.ExpContext;

public class Caminante extends compiladoresBaseVisitor<String> {

    private Integer asignaciones = 0;

    @Override
    public String visitPrograma(ProgramaContext ctx) {
        System.out.println("Comenzamos a caminar el árbol");
        String ret = super.visitPrograma(ctx);
        System.out.println("Se realizaron " + asignaciones + " asignaciones");
        return ret;
    }

    @Override
    public String visitAsignacion(AsignacionContext ctx) {
        asignaciones++;
        System.out.println("Soy un nodo y tengo : " + ctx.getChildCount() + " hijos.");
        System.out.println(" -> asignando valor a " + ctx.getChild(0).getText());
        return ctx.getText();
    }

    @Override
    public String visitExpresion(ExpresionContext ctx) {
        System.out.println("Llegamos a las expresiones");
        return super.visitExpresion(ctx);
    }

    @Override
    public String visitFactor(FactorContext ctx) {
        System.out.println("FACTOR tiene " + ctx.getChildCount() + " hijos - texto " + ctx.getText());
        if (ctx.getChildCount() == 3) {
            System.out.println("Salto a exp");
            return super.visitExp((ExpContext) ctx.getChild(1));
        }
        return super.visitFactor(ctx);
    }

    @Override
    public String visitExp(ExpContext ctx) {
        System.out.println("Llegamos a las exp");
        return super.visitExp(ctx);
    }

    @Override
    public String visitTerminal(TerminalNode node) {
        // System.out.println("Soy una hoja y tengo el token: " + node.getText());
        return super.visitTerminal(node);
    }
}
