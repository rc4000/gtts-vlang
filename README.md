# gtts-vlang
Google Text-to-Speech support for The V Programming Language 



## How to install:
Install gtts using:
```
v install rc4000.gtts
```


## How to use:
```v
import rc4000.gtts // i wish it was just gtts to import

fn main(){
	gtts.save_to_file("Hello world",  "en",  "hello.mp3")!
  //                      ↑ text          ↑ language   ↑ path
}

```

## Languages
For the language you need to use the ISO-639 code,
here is a small list: <br>
see the full list at: https://cloud.google.com/translate/docs/languages


| Lenguaje  | ISO-639 code | 
|-----------|-----------|
| English   |     en    |
| Spanish   |     es    |
| Portuguese|     pt    |
|German     |     de    |
|French	    |     fr    |




