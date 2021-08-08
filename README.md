
# EM-ONScripter

An emscripten port of ONScripter-jh


## Screenshots

![Screenshot](https://i.loli.net/2021/08/08/M8oHmtVkGTnpsxZ.png)
## Tests

To run tests, run the following command

```bash
  git clone https://github.com/wcwac/em-onscripter.git
  cd em-onscripter
  make -j4
  python -m http.server 8000
```

Then open your browser and visit http://127.0.0.1:8000/onscripter.html to see the results
  
## What's working now

* Run the game
* Display text and pictures
* Play sounds and BGM

## What's not working now

* Save and load
* Play AVI video
* Built-in LUA script
## Acknowledgements

 - [ONScripter](http://onscripter.osdn.jp/onscripter.html)
 - [ONScripter-jh](https://bitbucket.org/jh10001/onscripter-jh)
 - [Emscripten](https://emscripten.org)

  
## License

[GPL2](https://github.com/wcwac/em-onscripter/blob/master/LICENSE/)

  