package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

public enum Rutina {
	LEVE {
		@Override
		public boolean rutinaActiva() {
			return false;
		}

		@Override
		public boolean rutinaActivaConEjercicioAdicional() {
			return false;
		}
	},
	NADA {
		@Override
		public boolean rutinaActiva() {
			return false;
		}

		@Override
		public boolean rutinaActivaConEjercicioAdicional() {
			return false;
		}
	},
	MEDIANO {
		@Override
		public boolean rutinaActiva() {
			return false;
		}

		@Override
		public boolean rutinaActivaConEjercicioAdicional() {
			return false;
		}
	},
	INTENSIVO {
		@Override
		public boolean rutinaActiva() {
			return true;
		}

		@Override
		public boolean rutinaActivaConEjercicioAdicional() {
			return true;
		}
	},
	ACTIVA_SIN_EJERCICIO {
		@Override
		public boolean rutinaActiva() {
			return true;
		}

		@Override
		public boolean rutinaActivaConEjercicioAdicional() {
			return false;
		}
	};
	
	public abstract boolean rutinaActiva();
	
	public abstract boolean rutinaActivaConEjercicioAdicional();
}