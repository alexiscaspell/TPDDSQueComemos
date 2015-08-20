package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums;

public enum Condimento {
	SAL {
		@Override
		public int cantidadDeAzucar(int cantidadCondimento) {
			return 0;
		}
	},
	CALDO {
		@Override
		public int cantidadDeAzucar(int cantidadCondimento) {
			return 0;
		}
	},
	AZUCAR {
		@Override
		public int cantidadDeAzucar(int cantidadCondimento) {
			return cantidadCondimento;
		}
	},
	CREMA {
		@Override
		public int cantidadDeAzucar(int cantidadCondimento) {
			return 0;
		}
	},
	ACEITE {
		@Override
		public int cantidadDeAzucar(int cantidadCondimento) {
			return 0;
		}
	},
	LEVADURA {
		@Override
		public int cantidadDeAzucar(int cantidadCondimento) {
			return 0;
		}
	};
	
	//En cada método se multiplica la cantidad por el porcentaje de azucar que contenga el condimento.
	//El azucar es 100% azucar por eso no se multiplica por nada
	public abstract int cantidadDeAzucar(int cantidadCondimento);
}
