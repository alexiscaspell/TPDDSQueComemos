package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Enums;

public enum Ingrediente {
	POLLO {
		@Override
		public boolean contieneCarne() {
			return true;
		}

		@Override
		public boolean contieneFruta() {
			return false;
		}
	},
	CARNE {
		@Override
		public boolean contieneCarne() {
			return true;
		}

		@Override
		public boolean contieneFruta() {
			return false;
		}
	},
	CHIVITO {
		@Override
		public boolean contieneCarne() {
			return true;
		}

		@Override
		public boolean contieneFruta() {
			return false;
		}
	},
	CHORI {
		@Override
		public boolean contieneCarne() {
			return true;
		}

		@Override
		public boolean contieneFruta() {
			return false;
		}
	},
	PAPA {
		@Override
		public boolean contieneCarne() {
			return false;
		}

		@Override
		public boolean contieneFruta() {
			return false;
		}
	},
	HUEVO {
		@Override
		public boolean contieneCarne() {
			return false;
		}

		@Override
		public boolean contieneFruta() {
			return false;
		}
	},
	PAN_RAYADO {
		@Override
		public boolean contieneCarne() {
			return false;
		}

		@Override
		public boolean contieneFruta() {
			return false;
		}
	},	
	FRUTA {
		@Override
		public boolean contieneCarne() {
			return false;
		}

		@Override
		public boolean contieneFruta() {
			return true;
		}
	};
	
	public abstract boolean contieneCarne();
	
	public abstract boolean contieneFruta();
}