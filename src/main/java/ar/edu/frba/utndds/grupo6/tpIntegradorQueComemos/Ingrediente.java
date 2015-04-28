package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos;

public enum Ingrediente {
	POLLO {
		@Override
		public boolean contieneCarne() {
			return true;
		}
	},
	CARNE {
		@Override
		public boolean contieneCarne() {
			// TODO Auto-generated method stub
			return true;
		}
	},
	CHIVITO {
		@Override
		public boolean contieneCarne() {
			// TODO Auto-generated method stub
			return true;
		}
	},
	CHORI {
		@Override
		public boolean contieneCarne() {
			// TODO Auto-generated method stub
			return false;
		}
	},
	PAPA {
		@Override
		public boolean contieneCarne() {
			// TODO Auto-generated method stub
			return false;
		}
	},
	HUEVO {
		@Override
		public boolean contieneCarne() {
			// TODO Auto-generated method stub
			return false;
		}
	},
	PAN_RAYADO {
		@Override
		public boolean contieneCarne() {
			// TODO Auto-generated method stub
			return false;
		}
	},	
	FRUTA {
		@Override
		public boolean contieneCarne() {
			// TODO Auto-generated method stub
			return false;
		}
	};
	
	public abstract boolean contieneCarne();
}