package Web




import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
//
@Controller
class MainController {

	extension JSONUtils jsonUtils = new JSONUtils

	def static void main(String[] args) {
		XTRest.start(MainController, 9000)
	}
	
}