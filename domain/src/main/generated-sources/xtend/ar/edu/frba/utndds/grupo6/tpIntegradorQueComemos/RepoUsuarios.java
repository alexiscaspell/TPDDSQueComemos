package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.IRepoUsuarios;
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;

@SuppressWarnings("all")
public class RepoUsuarios implements IRepoUsuarios {
  private List<Usuario> listaUsuarios = new ArrayList<Usuario>();
  
  public Boolean existe(final Usuario usuario) {
    return Boolean.valueOf(this.listaUsuarios.contains(usuario));
  }
  
  public void add(final Usuario usuario) {
    this.listaUsuarios.add(usuario);
  }
  
  public void remove(final Usuario usuario) {
    this.listaUsuarios.remove(this.listaUsuarios);
  }
  
  public void update(final Usuario usuario) {
    final Usuario usuarioEncontrado = this.get(usuario);
    this.listaUsuarios.remove(usuarioEncontrado);
    this.listaUsuarios.add(usuario);
  }
  
  public Usuario get(final Usuario usuario) {
    final Function1<Usuario, Boolean> _function = new Function1<Usuario, Boolean>() {
      public Boolean apply(final Usuario x) {
        String _nombre = x.getNombre();
        String _nombre_1 = usuario.getNombre();
        return Boolean.valueOf(_nombre.equals(_nombre_1));
      }
    };
    return IterableExtensions.<Usuario>findFirst(this.listaUsuarios, _function);
  }
  
  public Usuario get(final String nombre) {
    final Function1<Usuario, Boolean> _function = new Function1<Usuario, Boolean>() {
      public Boolean apply(final Usuario x) {
        String _nombre = x.getNombre();
        return Boolean.valueOf(_nombre.equals(nombre));
      }
    };
    return IterableExtensions.<Usuario>findFirst(this.listaUsuarios, _function);
  }
  
  public List<Usuario> list(final Usuario usuario) {
    final Function1<Usuario, Boolean> _function = new Function1<Usuario, Boolean>() {
      public Boolean apply(final Usuario x) {
        String _nombre = x.getNombre();
        String _nombre_1 = usuario.getNombre();
        return Boolean.valueOf(_nombre.equals(_nombre_1));
      }
    };
    Iterable<Usuario> _filter = IterableExtensions.<Usuario>filter(this.listaUsuarios, _function);
    final List<Usuario> listaUsuariosConElMismoNombre = IterableExtensions.<Usuario>toList(_filter);
    final Function1<Usuario, Boolean> _function_1 = new Function1<Usuario, Boolean>() {
      public Boolean apply(final Usuario usuarioFiltrado) {
        return usuarioFiltrado.cumpleMismasCondiciones(usuario);
      }
    };
    Iterable<Usuario> _filter_1 = IterableExtensions.<Usuario>filter(listaUsuariosConElMismoNombre, _function_1);
    return IterableExtensions.<Usuario>toList(_filter_1);
  }
}
