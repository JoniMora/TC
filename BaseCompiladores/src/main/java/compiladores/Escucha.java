package compiladores;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ErrorNode;
import org.antlr.v4.runtime.tree.TerminalNode;

import compiladores.compiladoresParser.InstruccionContext;
import compiladores.compiladoresParser.ProgramaContext;

public class Escucha extends compiladoresBaseListener {
    private Integer nodos = 0;
    private Integer hojas = 0;
    private Integer tokens = 0;
    private Integer errores = 0;

    @Override
    public void enterEveryRule(ParserRuleContext ctx) {
        nodos++;
        System.out.println("Entro a NODO: " + ctx.getText());
        super.enterEveryRule(ctx);
    }

    @Override
    public void exitEveryRule(ParserRuleContext ctx) {
        System.out.println("Salgo de NODO: " + ctx.getText());
        super.exitEveryRule(ctx);
    }

    @Override
    public void enterInstruccion(InstruccionContext ctx) {
        System.out.println("Entro a INSTRUCCION: | " + ctx.getText() + " | - hijos = " + ctx.getChildCount());
        super.enterInstruccion(ctx);
    }

    @Override
    public void exitInstruccion(InstruccionContext ctx) {
        System.out.println("Salgo de INSTRUCCION: | " + ctx.getText() + " | - hijos = " + ctx.getChildCount());
        super.exitInstruccion(ctx);
    }

    @Override
    public void enterPrograma(ProgramaContext ctx) {
        System.out.println("\nComienza la compilacion...");
        super.enterPrograma(ctx);
    }

    @Override
    public void exitPrograma(ProgramaContext ctx) {
        System.out.println("Fin de la compilacion...");
        System.out.println("\nSe visitaron " + nodos + " nodos");
        System.out.println("- Hay " + tokens + " tokens");
        System.out.println("- Hay " + hojas + " hojas");
        System.out.println("\nSe encontraron " + errores + " errores");
        super.exitPrograma(ctx);
    }

    @Override
    public void visitTerminal(TerminalNode node) {
        tokens++;
        hojas++;
        System.out.println("Estoy en una HOJA --> " + node.getText());
        super.visitTerminal(node);
    }

    @Override
    public void visitErrorNode(ErrorNode node) {
        errores++;
        System.out.println("Error: " + node.getText());
        super.visitErrorNode(node);
    }

    @Override
    public String toString() {
        return "Escucha [nodos=" + nodos + ", hojas=" + hojas + ", tokens=" + tokens + ", errores=" + errores + "]";
    }
}