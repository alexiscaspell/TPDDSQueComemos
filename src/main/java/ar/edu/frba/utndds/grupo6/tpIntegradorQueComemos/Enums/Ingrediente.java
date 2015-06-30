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
	REMOLACHA {
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
	},
	
	FRUTILLA{
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
			return true;
		}
	},
	LECHUGA
	{
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
	},
	CROUTONS 
	{
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
	},
	PARMESANO
 {
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
	},	
	MANZANA
 {
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
			return true;
		}
	},	
	NUECES
 {
		@Override
		public boolean contieneCarne() {
			return false;
		}

		@Override
		public boolean esCaro() {
			return true;
		}

		@Override
		public boolean contieneFruta() {
			return false;
		}
	},	
	LIMON
 {
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
			return true;
		}
	},	
	BERBERECHOS
 {
		@Override
		public boolean contieneCarne() {
			return false;
		}

		@Override
		public boolean esCaro() {
			return true;
		}

		@Override
		public boolean contieneFruta() {
			return false;
		}
	},	
	AJO
 {
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
	},	
	MEJILLONES
 {
		@Override
		public boolean contieneCarne() {
			return false;
		}

		@Override
		public boolean esCaro() {
			return true;
		}

		@Override
		public boolean contieneFruta() {
			return false;
		}
	},	
	TOMATE
 {
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
			return true;
		}
	},	
	LANGOSTINOS
 {
		@Override
		public boolean contieneCarne() {
			return false;
		}

		@Override
		public boolean esCaro() {
			return true;
		}

		@Override
		public boolean contieneFruta() {
			return false;
		}
	},	
	ZANAHORIA
 {
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
	},
	CALABAZA
 {
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
	},	
	ACEITE
 {
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
	},
	BIFE_ANGOSTO
 {
		@Override
		public boolean contieneCarne() {
			return true;
		}

		@Override
		public boolean esCaro() {
			return false;
		}

		@Override
		public boolean contieneFruta() {
			return false;
		}
	},	
	TOMILLO
 {
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
	},	
	ALBAHACA
 {
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
	},	
	MOZZARELLA
 {
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
	},
	TAPA_DE_PANQUEQUE
 {
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
	},
	RICOTA
 {
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
	},
	ACELGA
 {
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
	},
	PURE_DE_TOMATE
 {
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
	},
	ARROZ_YAMANI
 {
		@Override
		public boolean contieneCarne() {
			return false;
		}

		@Override
		public boolean esCaro() {
			return true;
		}

		@Override
		public boolean contieneFruta() {
			return false;
		}
	},
	ALGA
 {
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
	},
	PALTA
 {
		@Override
		public boolean contieneCarne() {
			return false;
		}

		@Override
		public boolean esCaro() {
			return true;
		}

		@Override
		public boolean contieneFruta() {
			return false;
		}
	},
	WHISKY
 {
		@Override
		public boolean contieneCarne() {
			return false;
		}

		@Override
		public boolean esCaro() {
			return true;
		}

		@Override
		public boolean contieneFruta() {
			return false;
		}
	},
	BOURBON
 {
		@Override
		public boolean contieneCarne() {
			return false;
		}

		@Override
		public boolean esCaro() {
			return true;
		}

		@Override
		public boolean contieneFruta() {
			return false;
		}
	},
	GINEBRA
 {
		@Override
		public boolean contieneCarne() {
			return false;
		}

		@Override
		public boolean esCaro() {
			return true;
		}

		@Override
		public boolean contieneFruta() {
			return false;
		}
	},
	LECHE
 {
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
	},
	HELADO_CHOCOLATE
 {
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
	},
	HELADO_FRITULLA
	
 {
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