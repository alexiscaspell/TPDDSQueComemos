package ar.edu.frba.utndds.grupo6.ui.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.CheckBox;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.List;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.tables.Table;
import org.uqbar.arena.windows.MainWindow;
import org.uqbar.lacar.ui.model.ControlBuilder;

@SuppressWarnings("all")
public class PanelUsuario extends MainWindow<Receta> {
  public PanelUsuario() {
    super(new Receta());
  }
  
  public void createContents(final Panel mainPanel) {
    this.setTitle("Detalle de Receta");
    Panel _panel = new Panel(mainPanel);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        Label _label = new Label(it);
        _label.<Object, ControlBuilder>bindValueToProperty("nombre");
        Panel _panel = new Panel(it);
        final Procedure1<Panel> _function = new Procedure1<Panel>() {
          public void apply(final Panel it) {
            HorizontalLayout _horizontalLayout = new HorizontalLayout();
            it.setLayout(_horizontalLayout);
            Label _label = new Label(it);
            _label.setText("Bind a Calorias");
            Label _label_1 = new Label(it);
            _label_1.setText("Bind a nombre creador?");
          }
        };
        ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
      }
    };
    ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
    Panel _panel_1 = new Panel(mainPanel);
    final Procedure1<Panel> _function_1 = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        HorizontalLayout _horizontalLayout = new HorizontalLayout();
        it.setLayout(_horizontalLayout);
        Panel _panel = new Panel(it);
        final Procedure1<Panel> _function = new Procedure1<Panel>() {
          public void apply(final Panel it) {
            Label _label = new Label(it);
            _label.setText("Dificultad");
            Label _label_1 = new Label(it);
            _label_1.setText("Bind a Dificultad");
            Label _label_2 = new Label(it);
            _label_2.setText("Ingredientes");
            new Table<Receta>(it, Receta.class);
            new CheckBox(it);
          }
        };
        ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
        Panel _panel_1 = new Panel(it);
        final Procedure1<Panel> _function_1 = new Procedure1<Panel>() {
          public void apply(final Panel it) {
            Label _label = new Label(it);
            _label.setText("Temporada");
            Label _label_1 = new Label(it);
            _label_1.setText("Bind a Temporada");
            Label _label_2 = new Label(it);
            _label_2.setText("Condimentos");
            new List<Object>(it);
            Label _label_3 = new Label(it);
            _label_3.setText("Condiciones Preexistentes");
            new List<Object>(it);
          }
        };
        ObjectExtensions.<Panel>operator_doubleArrow(_panel_1, _function_1);
      }
    };
    ObjectExtensions.<Panel>operator_doubleArrow(_panel_1, _function_1);
    Panel _panel_2 = new Panel(mainPanel);
    final Procedure1<Panel> _function_2 = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        Label _label = new Label(it);
        _label.setText("Proceso de Preparacion");
        Label _label_1 = new Label(it);
        _label_1.setText("Bind a Descipcion de Preparacion");
        Button _button = new Button(it);
        final Procedure1<Button> _function = new Procedure1<Button>() {
          public void apply(final Button it) {
            it.setCaption("Volver");
          }
        };
        ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
      }
    };
    ObjectExtensions.<Panel>operator_doubleArrow(_panel_2, _function_2);
  }
  
  public static void main(final String[] args) {
    PanelUsuario _panelUsuario = new PanelUsuario();
    _panelUsuario.startApplication();
  }
}
