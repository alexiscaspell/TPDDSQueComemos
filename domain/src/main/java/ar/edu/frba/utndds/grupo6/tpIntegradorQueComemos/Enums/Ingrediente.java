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

		@Override
		public String nombre() {
			return "Pollo";
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

		@Override
		public String nombre() {
			return "Carne";
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

		@Override
		public String nombre() {
			return "Remolacha";
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

		@Override
		public String nombre() {
			return "Chivito";
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

		@Override
		public String nombre() {
			return "Chori";
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

		@Override
		public String nombre() {
			return "Papa";
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

		@Override
		public String nombre() {
			return "Huevo";
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

		@Override
		public String nombre() {
			return "Pan Rayado";
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

		@Override
		public String nombre() {
			return "Fruta";
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

		@Override
		public String nombre() {
			return "Lechón";
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

		@Override
		public String nombre() {
			return "Alcaparras";
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

		@Override
		public String nombre() {
			return "Salmón";
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

		@Override
		public String nombre() {
			return "Lomo";
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

		@Override
		public String nombre() {
			return "Harina";
		}
	},

	FRUTILLA {
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

		@Override
		public String nombre() {
			// TODO Auto-generated method stub
			return null;
		}
	},
	LECHUGA {
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

		@Override
		public String nombre() {
			return "Harina";
		}
	},
	CROUTONS {
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

		@Override
		public String nombre() {
			return "Croutons";
		}
	},
	PARMESANO {
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

		@Override
		public String nombre() {
			return "Parmesano";
		}
	},
	MANZANA {
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

		@Override
		public String nombre() {
			return "Manzana";
		}
	},
	NUECES {
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

		@Override
		public String nombre() {
			return "Nueces";
		}
	},
	LIMON {
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

		@Override
		public String nombre() {
			return "Limón";
		}
	},
	BERBERECHOS {
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

		@Override
		public String nombre() {
			return "Berberechos";
		}
	},
	AJO {
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

		@Override
		public String nombre() {
			return "Ajo";
		}
	},
	MEJILLONES {
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

		@Override
		public String nombre() {
			return "Mejillones";
		}
	},
	TOMATE {
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

		@Override
		public String nombre() {
			return "Tomate";
		}
	},
	LANGOSTINOS {
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

		@Override
		public String nombre() {
			return "Langostinos";
		}
	},
	ZANAHORIA {
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

		@Override
		public String nombre() {
			return "Zanahorias";
		}
	},
	CALABAZA {
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

		@Override
		public String nombre() {
			return "Calabaza";
		}
	},
	ACEITE {
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

		@Override
		public String nombre() {
			return "Aceite";
		}
	},
	BIFE_ANGOSTO {
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

		@Override
		public String nombre() {
			return "Bife Angosto";
		}
	},
	TOMILLO {
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

		@Override
		public String nombre() {
			return "Tomillo";
		}
	},
	ALBAHACA {
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

		@Override
		public String nombre() {
			return "Albahaca";
		}
	},
	MOZZARELLA {
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

		@Override
		public String nombre() {
			return "Mozzarella";
		}
	},
	TAPA_DE_PANQUEQUE {
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

		@Override
		public String nombre() {
			return "Tapa de Panqueque";
		}
	},
	RICOTA {
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

		@Override
		public String nombre() {
			return "Ricota";
		}
	},
	ACELGA {
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

		@Override
		public String nombre() {
			return "Acelga";
		}
	},
	PURE_DE_TOMATE {
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

		@Override
		public String nombre() {
			return "Puré de Tomate";
		}
	},
	ARROZ_YAMANI {
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

		@Override
		public String nombre() {
			return "Arroz Yamaní";
		}
	},
	ALGA {
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

		@Override
		public String nombre() {
			return "Alga";
		}
	},
	PALTA {
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

		@Override
		public String nombre() {
			return "Palta";
		}
	},
	WHISKY {
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

		@Override
		public String nombre() {
			return "Whisky";
		}
	},
	BOURBON {
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

		@Override
		public String nombre() {
			return "Bourbon";
		}
	},
	GINEBRA {
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

		@Override
		public String nombre() {
			return "Ginebra";
		}
	},
	LECHE {
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

		@Override
		public String nombre() {
			return "Leche";
		}
	},
	HELADO_CHOCOLATE {
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

		@Override
		public String nombre() {
			return "Helado de Chocolate";
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

		@Override
		public String nombre() {
			return "Helado de Frutilla";
		}
	};

	public abstract boolean contieneCarne();

	public abstract boolean esCaro();

	public abstract boolean contieneFruta();

	public abstract String nombre();
}