# Negation Marker

Tool designed to mark negations (both signals and scopes) in text. It was created for my master thesis. 
It's written in Angular 2 with Typescript.

## How to
**Run server:** `ng serve`

**Build:** `ng build` (build is located in *./dist* directory)

## Useful commands
`typings install dt~rangy -S -G`

`typings list`

## Stuff
I had to add definitions of this functions to RangySelection:
```
  expand(s2: string, options?): void;
  trim(): void;
```

Used libraries
---------

[Rangy](https://github.com/timdown/rangy)

XML structure
-------------
```xml
<?xml version="1.0" encoding="UTF-8"?>
<article>
  <meta>
    <url>http://...</url>
    <created>2016-07-23</created>
  </meta>
  <content>
    Lorem ipsum dolor sit amet, 
    <span class="negation-scope">consectetur adipiscing <span class="negation-signal">elit</span></span>. 
    Morbi finibus nisi ac leo rhoncus, a ullamcorper metus facilisis. Vivamus luctus metus lectus, nec auctor lorem 
    blandit vitae. Aliquam semper arcu vehicula orci volutpat, a vestibulum diam rhoncus. Etiam sit amet elit ac 
    turpis hendrerit bibendum. Sed laoreet ultrices ornare.  
  </content>
  
</article>
```
