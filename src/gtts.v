
module gtts

import net.http
import encoding.base64
import os


pub fn save_to_file(text string, lang string, path string)!{

	//You can see here the supported languages: https://cloud.google.com/translate/docs/languages

	/* Links that helped me with this project:

		https://gtts.readthedocs.io/en/latest/module.html
		https://support.mozilla.org/zu/questions/1341051
		https://github.com/pndurette/gTTS

	*/

	url := "https://translate.google.com/_/TranslateWebserverUi/data/batchexecute"
	data := "f.req=%5B%5B%5B%22jQ1olc%22%2C%22%5B%5C%22${text}%5C%22%2C%5C%22${lang}%5C%22%2Cnull%2C%5C%22null%5C%22%5D%22%2Cnull%2C%22generic%22%5D%5D%5D&"

	mut gtts_request := http.new_request(http.Method.post , url , data )

	gtts_request.add_header(http.CommonHeader.referer,"http://translate.google.com/")
	gtts_request.add_header(http.CommonHeader.user_agent,"Mozilla/5.0 (Windows NT 10.0; WOW64) ")
	gtts_request.add_header(http.CommonHeader.content_type,"application/x-www-form-urlencoded;charset=utf-8")
	gtts_request.add_header(http.CommonHeader.accept_encoding,"b64")

	response := gtts_request.do() or { return ConnectionError{}}
	
	sound_in_base64 := response.body.replace('[["wrb.fr","jQ1olc","[\\"',"").replace(")]}'","").split('\\"]"')[0].replace("\n","")

	sound_in_bytes := base64.decode(sound_in_base64)

	mut file := os.create(path) or { return err }
	file.write(sound_in_bytes) or { return err  }
	file.close() 


}



struct ConnectionError{
	Error
}

fn (err ConnectionError) msg() string {
	return 'The request to the server failed, please check your internet connection.'
}


