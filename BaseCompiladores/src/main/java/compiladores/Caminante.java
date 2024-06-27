package compiladores;

import org.antlr.v4.runtime.tree.TerminalNode;
import compiladores.compiladoresParser.AsignacionContext;
import compiladores.compiladoresParser.DeclaracionContext;
import compiladores.compiladoresParser.BloqueContext;
import compiladores.compiladoresParser.ProgramaContext;
import compiladores.compiladoresParser.ExpresionContext;
import compiladores.compiladoresParser.FactorContext;
import compiladores.compiladoresParser.ExpContext;

public class Caminante extends compiladoresBaseVisitor<String> {

    private Integer asignaciones = 0;
    private Integer declaraciones = 0;
    private Integer bloques = 0;
    private Integer expresiones = 0;

    private TablaSimbolo tablaSimbolos = new TablaSimbolo();

    @Override
    public String visitPrograma(ProgramaContext ctx) {
        System.out.println("Comenzamos a caminar el árbol");
        String ret = super.visitPrograma(ctx);
        System.out.println("Reporte del programa:");
        System.out.println("Asignaciones: " + asignaciones);
        System.out.println("Declaraciones: " + declaraciones);
        System.out.println("Bloques: " + bloques);
        System.out.println("Expresiones: " + expresiones);
        System.out.println("Tabla de símbolos:");
        System.out.println(tablaSimbolos);
        tablaSimbolos.reporteErrores();
        return ret;
    }

    @Override
    public String visitAsignacion(AsignacionContext ctx) {
        asignaciones++;
        String id = ctx.ID().getText();
        if (!tablaSimbolos.obtenerSimbolo(id).isInicializado()) {
            System.out.println("Error: Uso de un identificador no inicializado - " + id);
        } else {
            tablaSimbolos.inicializarSimbolo(id);
        }
        System.out.println("Asignación: " + ctx.getText());
        return super.visitAsignacion(ctx);
    }

    @Override
    public String visitDeclaracion(DeclaracionContext ctx) {
        declaraciones++;
        String tipo = ctx.tipo().getText();
        String id = ctx.ID().getText();
        if (!tablaSimbolos.agregarSimbolo(id, tipo)) {
            System.out.println("Error: Doble declaración del mismo identificador - " + id);
        }
        System.out.println("Declaración: " + ctx.getText());
        return super.visitDeclaracion(ctx);
    }

    @Override
    public String visitBloque(BloqueContext ctx) {
        bloques++;
        System.out.println("Bloque: " + ctx.getText());
        return super.visitBloque(ctx);
    }

    @Override
    public String visitExpresion(ExpresionContext ctx) {
        expresiones++;
        System.out.println("Expresión: " + ctx.getText());
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
        return super.visitTerminal(node);
    }
}