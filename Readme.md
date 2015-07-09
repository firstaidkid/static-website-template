Website Template
====================================

**Note: Just for personal use.**

Description
-----------

Simple static website built system using Grunt, Sass and TypeScript. 


Prerequisites
-------------

 **Node.js**: [nodejs.org](https://nodejs.org/)

 **NPM** (recommended): [npmjs.com](https://www.npmjs.com/) 

 **Grunt**: [gruntjs.com](http://gruntjs.com/getting-started)

 **SASS**: [sass-lang.com](http://sass-lang.com/install)

 **TypeScript**: [typescriptlang.org](http://www.typescriptlang.org/)




Installing
----------
**With NPM (recommended)**

Install Node Packages with `NPM`:
```
npm install
```

Install `SASS`:
```
sudo gem install sass
```

Create a `.ftppass` with your FTP login data:
```
{
  "yourDomain.com": {
    "username": "someUserName",
    "password": "somePassword"
  }
}
```

Adjust ftp-settings in `Gruntfile.coffee`:
```
'ftp-deploy':
	build:
		auth:
	  		host: 'yourDomain.com'
	  		port: 21
		src: 'dist'
		dest: 'projects/<%= pkg.name %>'
		exclusions: ['dist/**/.DS_Store', 'dist/**/Thumbs.db']
```


Using the build
---------------

Automated SASS and TypeScript building witch `grunt-watch`:
```
grunt watch
```

Generate static website:
```
grunt
```

Deploy to FTP:
```
grunt deploy
```


Folder Structure
----------------

```
+-- _build				// will contain all zipped dist-folder
+-- _dist				// will containt files ready for deployment
|	+-- _css
|	+-- _images
|	+-- _js
+-- _src
|	+-- _css			// compiled css-files form SASS
|	+-- _images			// static image files
|	+-- _js 			// compiles Javascript files from TypeScript 
|	+-- _partials		// HTML-partials
|	+-- _scss			// raw SASS code
|	|	+-- _partials	// single SASS packages
|	+-- _ts 			// TypeScript code
```


Author
------

Created by **Steffen Kolb** ([steffenkolb.de)(http://www.steffenkolb.de)).