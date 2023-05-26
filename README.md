# gtts-vlang
Google Text-to-Speech support for The V Programming Language 


how to use:
```v
import gtts

fn main(){
	gtts.save_to_file("Hello world",  "en",  "hello.mp3")!
  //                      ↑ text          ↑ language   ↑ path
}

```

for the language you need to use the ISO-639 code,
here is a small list: <br>
see the full list at: https://cloud.google.com/translate/docs/languages


| Lenguaje  | ISO-639 code | 
|-----------|-----------|
| English   |     en    |
| Spanish   |     es    |
| Portuguese|     pt    |
|German     |     de    |
|French	    |     fr    |

