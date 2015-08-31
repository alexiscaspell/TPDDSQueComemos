package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums;

public enum Temporada {
	INVIERNO {
		@Override
		public String nombre() {
			return "Invierno";
		}
	},
	VERANO {
		@Override
		public String nombre() {
			return "Verano";
		}
	},
	OTONIO {
		@Override
		public String nombre() {
			return "Otoño";
		}
	},
	PRIMAVERA {
		@Override
		public String nombre() {
			return "Primavera";
		}
	};
	
	public abstract String nombre();
}
