package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums;

public enum TipoReceta {
	PUBLICA {
		@Override
		public boolean esPublica() {
			return true;
		}
	},
	PRIVADA {
		@Override
		public boolean esPublica() {
			return false;
		}

	};

	public abstract boolean esPublica();
}