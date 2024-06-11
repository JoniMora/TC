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


// ======== Mas detallada pero deberia cambiar el escucha ========  //

//agregar librerias
// import compiladores.compiladoresParser.DeclaracionContext;
// import compiladores.compiladoresParser.BloqueContext;

// public class Caminante extends compiladoresBaseVisitor<String> {

//     private Integer asignaciones = 0;
//     private Integer declaraciones = 0;
//     private Integer bloques = 0;
//     private Integer expresiones = 0;

//     @Override
//     public String visitPrograma(ProgramaContext ctx) {
//         String ret = super.visitPrograma(ctx);
//         System.out.println("Reporte del programa:");
//         System.out.println("Asignaciones: " + asignaciones);
//         System.out.println("Declaraciones: " + declaraciones);
//         System.out.println("Bloques: " + bloques);
//         System.out.println("Expresiones: " + expresiones);
//         return ret;
//     }

//     @Override
//     public String visitAsignacion(AsignacionContext ctx) {
//         asignaciones++;
//         System.out.println("Asignación: " + ctx.getText());
//         System.out.println("Soy un nodo y tengo: " + ctx.getChildCount() + " hijos.");
//         System.out.println(" -> Asignando valor a " + ctx.getChild(0).getText());
//         return super.visitAsignacion(ctx);
//     }

//     @Override
//     public String visitDeclaracion(DeclaracionContext ctx) {
//         declaraciones++;
//         System.out.println("Declaración: " + ctx.getText());
//         return super.visitDeclaracion(ctx);
//     }

//     @Override
//     public String visitBloque(BloqueContext ctx) {
//         bloques++;
//         System.out.println("Bloque: " + ctx.getText());
//         return super.visitBloque(ctx);
//     }

//     @Override
//     public String visitExpresion(ExpresionContext ctx) {
//         expresiones++;
//         System.out.println("Expresión: " + ctx.getText());
//         return super.visitExpresion(ctx);
//     }

//     @Override
//     public String visitTerminal(TerminalNode node) {
//         // System.out.println("Soy una hoja y tengo el token: " + node.getText());
//         return super.visitTerminal(node);
//     }
// }
