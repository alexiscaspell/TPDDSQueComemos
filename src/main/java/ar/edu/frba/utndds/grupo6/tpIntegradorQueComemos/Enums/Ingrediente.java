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
		
		@Override
		public boolean esCaro() {
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
		
		@Override
		public boolean esCaro() {
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
		
		@Override
		public boolean esCaro() {
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
		
		@Override
		public boolean esCaro() {
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
		
		@Override
		public boolean esCaro() {
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
		
		@Override
		public boolean esCaro() {
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
		
		@Override
		public boolean esCaro() {
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
		
		@Override
		public boolean esCaro() {
			return false;
		}
	},
	
	LECHON {
		@Override
		public boolean contieneCarne() {
			return true;
		}
		
		@Override
		public boolean contieneFruta() {
			return true;
		}
		
		@Override
		public boolean esCaro() {
			return true;
		}
	},
	
	ALCAPARRAS {
		@Override
		public boolean contieneCarne() {
			return true;
		}
		
		@Override
		public boolean contieneFruta() {
			return true;
		}
		
		@Override
		public boolean esCaro() {
			return true;
		}
	},
	
	SALMON {
		@Override
		public boolean contieneCarne() {
			return true;
		}
		
		@Override
		public boolean contieneFruta() {
			return true;
		}
		
		@Override
		public boolean esCaro() {
			return true;
		}
	},
		
	LOMO {
		@Override
		public boolean contieneCarne() {
			return true;
		}
		
		@Override
		public boolean contieneFruta() {
			return true;
		}
		
		@Override
		public boolean esCaro() {
			return true;
		}
	},	
	HARINA {
		@Override
		public boolean contieneCarne() {
			return false;
		}

		@Override
		public boolean esCaro() {
			return false;
		}

		@Override
		public boolean contieneFruta() {
			return false;
		}
	};
	
	public abstract boolean contieneCarne();
	public abstract boolean esCaro();
	public abstract boolean contieneFruta();
}