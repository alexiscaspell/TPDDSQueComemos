package AplicationModel
import ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos.Usuario
import com.google.gson.JsonDeserializationContext
import com.google.gson.JsonDeserializer
import com.google.gson.JsonElement
import com.google.gson.JsonObject
import com.google.gson.JsonParseException
import com.google.gson.JsonPrimitive
import com.google.gson.JsonSerializationContext
import com.google.gson.JsonSerializer
import java.lang.reflect.Type

public class UsuarioAdapterJson implements JsonSerializer<Usuario>, JsonDeserializer<Usuario> {
    
    override JsonElement serialize(Usuario src, Type typeOfSrc, JsonSerializationContext context) {
        var result = new JsonObject();
        result.add("type", new JsonPrimitive(src.getClass().getSimpleName()));
        result.add("properties", context.serialize(src, src.getClass()));
 
        return result;
    }
 
    override Usuario deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context)
        throws JsonParseException {
        var jsonObject = json.getAsJsonObject();
        var type = jsonObject.get("type").getAsString();
        var element = jsonObject.get("properties");
 
        try {
            return context.deserialize(element, Class.forName("ar.edu.frba.utndds.grupo6.tpIntegradorQueComemos." + type));
        } catch (ClassNotFoundException cnfe) {
            throw new JsonParseException("Unknown element type: " + type, cnfe);
        }
    }
}