package ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Persistencia

import org.mongodb.morphia.dao.BasicDAO
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Receta
import org.mongodb.morphia.Morphia
import com.mongodb.MongoClient

class RecetaDAO extends BasicDAO<Receta, String> {
	new (Morphia morphia, MongoClient mongo ) {
        super(mongo, morphia, "QueComemosDB");
    }
}