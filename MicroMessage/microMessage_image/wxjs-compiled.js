(function(){function x(b){for(var e=[],j=0;j<arguments.length;j++)e.push(arguments[j]);var j=e.shift(),a;try{e.unshift(j),a=G.apply(null,e)}catch(f){a=b}o("log",{msg:a})}function o(b,e,j){if(b&&"string"===typeof b){"object"!==typeof e&&(e={});var a=(O++).toString();"function"===typeof j&&(E[a]=j);b={func:b,params:e};b[H]="call";b[D]=a;a=y.stringify(b);I.push(a);document.location=P}}function z(b,e){b&&"string"===typeof b&&"function"===typeof e&&(C[b]=e)}function B(b,e){if("function"===typeof C[b])C[b](e)}
function F(b,e){var j=new Image,a=!1;j.onload=function(){a||(a=!0,e(j))};j.src=b;setTimeout(function(){a||(a=!0,e(j))},1E3)}function Q(b,e){F(b.src,function(b){var a=/^data:image\/(png|jpg|jpeg|tiff|gif|bmp);base64,/i,f="";if(b.src.match(a))f=b.src;else{var i=document.createElement("canvas");i.width=b.width;i.height=b.height;i.getContext("2d").drawImage(b,0,0);var d="jpg",q=b.src.match(/\.(png|jpg|jpeg|tiff|gif|bmp)$/i);q&&(d=q[1].toLowerCase());try{f=i.toDataURL("image/"+d)}catch(m){x(m.message)}}e(f.replace(a,
""),b)})}function R(){k('a[href^="weixin://viewimage/"]').on("click",function(b){for(var e="",e=("string"===typeof b.target.href&&0===b.target.href.search("weixin://viewimage/")?b.target:k(b.target).parents('a[href^="weixin://viewimage/"]')[0]).href.substr(19),j=k('a[href^="weixin://viewimage/"]'),a=[],f=0;f<j.length;f++)a.push(j[f].href.substr(19));o("imagePreview",{urls:a,current:e});b.preventDefault()})}function S(){k('a[href^="weixin://readershare/"]').on("click",function(b){b.preventDefault();
B("menu:share:weibo",u.shareWeiboData||{})});k('a[href^="weixin://readertimeline/"]').on("click",function(b){b.preventDefault();B("menu:share:timeline",u.shareTimelineData||{})})}function T(){var b=k("audio");b.on("play",function(){o("audioStateChanged",{state:"play"})});b.on("ended",function(){o("audioStateChanged",{state:"ended"})});b.on("pause",function(){o("audioStateChanged",{state:"pause"})});b=k("video");b.on("play",function(){o("videoStateChanged",{state:"play"})});b.on("ended",function(){o("videoStateChanged",
{state:"ended"})});b.on("pause",function(){o("videoStateChanged",{state:"pause"})})}(function(b){String.prototype.trim===b&&(String.prototype.trim=function(){return this.replace(/^\s+/,"").replace(/\s+$/,"")});Array.prototype.reduce===b&&(Array.prototype.reduce=function(e){if(this===void 0||this===null)throw new TypeError;var j=Object(this),a=j.length>>>0,f=0,i;if(typeof e!="function")throw new TypeError;if(a==0&&arguments.length==1)throw new TypeError;if(arguments.length>=2)i=arguments[1];else{do{if(f in
j){i=j[f++];break}if(++f>=a)throw new TypeError;}while(1)}for(;f<a;){f in j&&(i=e.call(b,i,j[f],f,j));f++}return i})})();var k=function(){function b(c){return"[object Function]"==F.call(c)}function e(c){return c instanceof Object}function j(c){var a,J;if("[object Object]"!==F.call(c))return!1;J=b(c.constructor)&&c.constructor.prototype;if(!J||!hasOwnProperty.call(J,"isPrototypeOf"))return!1;for(a in c);return a===l||hasOwnProperty.call(c,a)}function a(c){return c instanceof Array}function f(c){return"number"==
typeof c.length}function i(c){return c.filter(function(c){return c!==l&&null!==c})}function d(c){return c.replace(/::/g,"/").replace(/([A-Z]+)([A-Z][a-z])/g,"$1_$2").replace(/([a-z\d])([A-Z])/g,"$1_$2").replace(/_/g,"-").toLowerCase()}function q(c){return c in o?o[c]:o[c]=RegExp("(^|\\s)"+c+"(\\s|$)")}function m(c,a){return a===l?g(c):g(c).filter(a)}function h(c,a,J,d){return b(a)?a.call(c,J,d):a}function n(c,a,b){var d=c%2?a:a.parentNode;d?d.insertBefore(b,!c?a.nextSibling:1==c?d.firstChild:2==c?
a:null):g(b).remove()}function A(c,a){a(c);for(var b in c.childNodes)A(c.childNodes[b],a)}var l,p,g,r,v=[],s=v.slice,w=window.document,k={},o={},u=w.defaultView.getComputedStyle,M={"column-count":1,columns:1,"font-weight":1,"line-height":1,opacity:1,"z-index":1,zoom:1},x=/^\s*<(\w+|!)[^>]*>/,y=[1,3,8,9,11],z=w.createElement("table"),B=w.createElement("tr"),C={tr:w.createElement("tbody"),tbody:z,thead:z,tfoot:z,td:B,th:B,"*":w.createElement("div")},D=/complete|loaded|interactive/,E=/^\.([\w-]+)$/,
G=/^#([\w-]+)$/,I=/^[\w-]+$/,F={}.toString,t={},L,K,H=w.createElement("div");t.matches=function(c,a){if(!c||1!==c.nodeType)return!1;var b=c.webkitMatchesSelector||c.mozMatchesSelector||c.oMatchesSelector||c.matchesSelector;if(b)return b.call(c,a);var d;d=c.parentNode;(b=!d)&&(d=H).appendChild(c);d=~t.qsa(d,a).indexOf(c);b&&H.removeChild(c);return d};L=function(c){return c.replace(/-+(.)?/g,function(c,a){return a?a.toUpperCase():""})};K=function(c){return c.filter(function(a,b){return c.indexOf(a)==
b})};t.fragment=function(c,a){a===l&&(a=x.test(c)&&RegExp.$1);a in C||(a="*");var b=C[a];b.innerHTML=""+c;return g.each(s.call(b.childNodes),function(){b.removeChild(this)})};t.Z=function(c,a){c=c||[];c.__proto__=arguments.callee.prototype;c.selector=a||"";return c};t.isZ=function(c){return c instanceof t.Z};t.init=function(c,d){if(c){if(b(c))return g(w).ready(c);if(t.isZ(c))return c;var r;if(a(c))r=i(c);else if(j(c))r=[g.extend({},c)],c=null;else if(0<=y.indexOf(c.nodeType)||c===window)r=[c],c=null;
else if(x.test(c))r=t.fragment(c.trim(),RegExp.$1),c=null;else{if(d!==l)return g(d).find(c);r=t.qsa(w,c)}return t.Z(r,c)}return t.Z()};g=function(c,a){return t.init(c,a)};g.extend=function(c){s.call(arguments,1).forEach(function(a){for(p in a)a[p]!==l&&(c[p]=a[p])});return c};t.qsa=function(c,a){var b;return c===w&&G.test(a)?(b=c.getElementById(RegExp.$1))?[b]:v:1!==c.nodeType&&9!==c.nodeType?v:s.call(E.test(a)?c.getElementsByClassName(RegExp.$1):I.test(a)?c.getElementsByTagName(a):c.querySelectorAll(a))};
g.isFunction=b;g.isObject=e;g.isArray=a;g.isPlainObject=j;g.inArray=function(c,a,b){return v.indexOf.call(a,c,b)};g.trim=function(c){return c.trim()};g.uuid=0;g.map=function(c,a){var b,d=[],r;if(f(c))for(r=0;r<c.length;r++)b=a(c[r],r),null!=b&&d.push(b);else for(r in c)b=a(c[r],r),null!=b&&d.push(b);return 0<d.length?[].concat.apply([],d):d};g.each=function(c,a){var b;if(f(c))for(b=0;b<c.length&&!1!==a.call(c[b],b,c[b]);b++);else for(b in c)if(!1===a.call(c[b],b,c[b]))break;return c};g.fn={forEach:v.forEach,
reduce:v.reduce,push:v.push,indexOf:v.indexOf,concat:v.concat,map:function(c){return g.map(this,function(a,b){return c.call(a,b,a)})},slice:function(){return g(s.apply(this,arguments))},ready:function(c){D.test(w.readyState)?c(g):w.addEventListener("DOMContentLoaded",function(){c(g)},!1);return this},get:function(c){return c===l?s.call(this):this[c]},toArray:function(){return this.get()},size:function(){return this.length},remove:function(){return this.each(function(){null!=this.parentNode&&this.parentNode.removeChild(this)})},
each:function(c){this.forEach(function(a,b){c.call(a,b,a)});return this},filter:function(c){return g([].filter.call(this,function(a){return t.matches(a,c)}))},add:function(c,a){return g(K(this.concat(g(c,a))))},is:function(c){return 0<this.length&&t.matches(this[0],c)},not:function(c){var a=[];if(b(c)&&c.call!==l)this.each(function(b){c.call(this,b)||a.push(this)});else{var d="string"==typeof c?this.filter(c):f(c)&&b(c.item)?s.call(c):g(c);this.forEach(function(c){0>d.indexOf(c)&&a.push(c)})}return g(a)},
eq:function(c){return-1===c?this.slice(c):this.slice(c,+c+1)},first:function(){var c=this[0];return c&&!e(c)?c:g(c)},last:function(){var c=this[this.length-1];return c&&!e(c)?c:g(c)},find:function(c){var a;a=1==this.length?t.qsa(this[0],c):this.map(function(){return t.qsa(this,c)});return g(a)},closest:function(c,a){for(var b=this[0];b&&!t.matches(b,c);)b=b!==a&&b!==w&&b.parentNode;return g(b)},parents:function(c){for(var a=[],b=this;0<b.length;)b=g.map(b,function(c){if((c=c.parentNode)&&c!==w&&0>
a.indexOf(c))return a.push(c),c});return m(a,c)},parent:function(c){return m(K(this.pluck("parentNode")),c)},children:function(c){return m(this.map(function(){return s.call(this.children)}),c)},siblings:function(c){return m(this.map(function(c,a){return s.call(a.parentNode.children).filter(function(c){return c!==a})}),c)},empty:function(){return this.each(function(){this.innerHTML=""})},pluck:function(c){return this.map(function(){return this[c]})},show:function(){return this.each(function(){"none"==
this.style.display&&(this.style.display=null);if("none"==u(this,"").getPropertyValue("display")){var c=this.style,a=this.nodeName,b,d;k[a]||(b=w.createElement(a),w.body.appendChild(b),d=u(b,"").getPropertyValue("display"),b.parentNode.removeChild(b),"none"==d&&(d="block"),k[a]=d);c.display=k[a]}})},replaceWith:function(c){return this.before(c).remove()},wrap:function(c){return this.each(function(){g(this).wrapAll(g(c)[0].cloneNode(!1))})},wrapAll:function(c){this[0]&&(g(this[0]).before(c=g(c)),c.append(this));
return this},unwrap:function(){this.parent().each(function(){g(this).replaceWith(g(this).children())});return this},clone:function(){return g(this.map(function(){return this.cloneNode(!0)}))},hide:function(){return this.css("display","none")},toggle:function(c){return(c===l?"none"==this.css("display"):c)?this.show():this.hide()},prev:function(){return g(this.pluck("previousElementSibling"))},next:function(){return g(this.pluck("nextElementSibling"))},html:function(c){return c===l?0<this.length?this[0].innerHTML:
null:this.each(function(a){var b=this.innerHTML;g(this).empty().append(h(this,c,a,b))})},text:function(c){return c===l?0<this.length?this[0].textContent:null:this.each(function(){this.textContent=c})},attr:function(c,a){var b;return"string"==typeof c&&a===l?0==this.length||1!==this[0].nodeType?l:"value"==c&&"INPUT"==this[0].nodeName?this.val():!(b=this[0].getAttribute(c))&&c in this[0]?this[0][c]:b:this.each(function(b){if(1===this.nodeType)if(e(c))for(p in c)this.setAttribute(p,c[p]);else this.setAttribute(c,
h(this,a,b,this.getAttribute(c)))})},removeAttr:function(c){return this.each(function(){1===this.nodeType&&this.removeAttribute(c)})},prop:function(c,a){return a===l?this[0]?this[0][c]:l:this.each(function(b){this[c]=h(this,a,b,this[c])})},data:function(c,a){var b=this.attr("data-"+d(c),a);return null!==b?b:l},val:function(c){return c===l?0<this.length?this[0].value:l:this.each(function(a){this.value=h(this,c,a,this.value)})},offset:function(){if(0==this.length)return null;var c=this[0].getBoundingClientRect();
return{left:c.left+window.pageXOffset,top:c.top+window.pageYOffset,width:c.width,height:c.height}},css:function(c,a){if(a===l&&"string"==typeof c)return 0==this.length?l:this[0].style[L(c)]||u(this[0],"").getPropertyValue(c);var b="";for(p in c)"string"==typeof c[p]&&""==c[p]?this.each(function(){this.style.removeProperty(d(p))}):b+=d(p)+":"+("number"==typeof c[p]&&!M[d(p)]?c[p]+"px":c[p])+";";"string"==typeof c&&(""==a?this.each(function(){this.style.removeProperty(d(c))}):b=d(c)+":"+("number"==
typeof a&&!M[d(c)]?a+"px":a));return this.each(function(){this.style.cssText+=";"+b})},index:function(c){return c?this.indexOf(g(c)[0]):this.parent().children().indexOf(this[0])},hasClass:function(c){return 1>this.length?!1:q(c).test(this[0].className)},addClass:function(c){return this.each(function(a){r=[];var b=this.className;h(this,c,a,b).split(/\s+/g).forEach(function(c){g(this).hasClass(c)||r.push(c)},this);r.length&&(this.className+=(b?" ":"")+r.join(" "))})},removeClass:function(c){return this.each(function(a){if(c===
l)return this.className="";r=this.className;h(this,c,a,r).split(/\s+/g).forEach(function(c){r=r.replace(q(c)," ")});this.className=r.trim()})},toggleClass:function(c,a){return this.each(function(b){b=h(this,c,b,this.className);(a===l?!g(this).hasClass(b):a)?g(this).addClass(b):g(this).removeClass(b)})}};["width","height"].forEach(function(c){g.fn[c]=function(a){var b,d=c.replace(/./,function(c){return c[0].toUpperCase()});return a===l?this[0]==window?window["inner"+d]:this[0]==w?w.documentElement["offset"+
d]:(b=this.offset())&&b[c]:this.each(function(b){var d=g(this);d.css(c,h(this,a,b,d[c]()))})}});["after","prepend","before","append"].forEach(function(c,a){g.fn[c]=function(){var c=g.map(arguments,function(c){return e(c)?c:t.fragment(c)});if(1>c.length)return this;var b=this.length,d=1<b,r=2>a;return this.each(function(v,f){for(var h=0;h<c.length;h++){var e=c[r?c.length-h-1:h];A(e,function(c){null!=c.nodeName&&("SCRIPT"===c.nodeName.toUpperCase()&&(!c.type||"text/javascript"===c.type))&&window.eval.call(window,
c.innerHTML)});d&&v<b-1&&(e=e.cloneNode(!0));n(a,f,e)}})};g.fn[a%2?c+"To":"insert"+(a?"Before":"After")]=function(a){g(a)[c](this);return this}});t.Z.prototype=g.fn;t.camelize=L;t.uniq=K;g._WXJS=t;return g}();window._WXJS=k;(function(b){function e(a){return a._zid||(a._zid=n++)}function j(b,d,f,i){d=a(d);if(d.ns)var g=RegExp("(?:^| )"+d.ns.replace(" "," .* ?")+"(?: |$)");return(h[e(b)]||[]).filter(function(a){return a&&(!d.e||a.e==d.e)&&(!d.ns||g.test(a.ns))&&(!f||e(a.fn)===e(f))&&(!i||a.sel==i)})}
function a(a){a=(""+a).split(".");return{e:a[0],ns:a.slice(1).sort().join(" ")}}function f(a,d,f){b.isObject(a)?b.each(a,f):a.split(/\s/).forEach(function(a){f(a,d)})}function i(d,v,i,g,j,l){var l=!!l,n=e(d),m=h[n]||(h[n]=[]);f(v,i,function(f,h){var v=j&&j(h,f),e=v||h,i=function(a){var b=e.apply(d,[a].concat(a.data));!1===b&&a.preventDefault();return b},v=b.extend(a(f),{fn:h,proxy:i,sel:g,del:v,i:m.length});m.push(v);d.addEventListener(v.e,i,l)})}function d(a,b,d,i){var g=e(a);f(b||"",d,function(b,
d){j(a,b,d,i).forEach(function(b){delete h[g][b.i];a.removeEventListener(b.e,b.proxy,!1)})})}function q(a){var d=b.extend({originalEvent:a},a);b.each(g,function(b,f){d[b]=function(){this[f]=l;return a[b].apply(a,arguments)};d[f]=p});return d}function m(a){if(!("defaultPrevented"in a)){a.defaultPrevented=!1;var b=a.preventDefault;a.preventDefault=function(){this.defaultPrevented=!0;b.call(this)}}}var h={},n=1,A={};A.click=A.mousedown=A.mouseup=A.mousemove="MouseEvents";b.event={add:i,remove:d};b.proxy=
function(a,d){if(b.isFunction(a)){var f=function(){return a.apply(d,arguments)};f._zid=e(a);return f}if("string"==typeof d)return b.proxy(a[d],a);throw new TypeError("expected function");};b.fn.bind=function(a,b){return this.each(function(){i(this,a,b)})};b.fn.unbind=function(a,b){return this.each(function(){d(this,a,b)})};b.fn.one=function(a,b){return this.each(function(f,h){i(this,a,b,null,function(a,b){return function(){var f=a.apply(h,arguments);d(h,b,a);return f}})})};var l=function(){return!0},
p=function(){return!1},g={preventDefault:"isDefaultPrevented",stopImmediatePropagation:"isImmediatePropagationStopped",stopPropagation:"isPropagationStopped"};b.fn.delegate=function(a,d,f){var h=!1;if("blur"==d||"focus"==d)b.iswebkit?d="blur"==d?"focusout":"focus"==d?"focusin":d:h=!0;return this.each(function(e,g){i(g,d,f,a,function(d){return function(f){var h,e=b(f.target).closest(a,g).get(0);if(e)return h=b.extend(q(f),{currentTarget:e,liveFired:g}),d.apply(e,[h].concat([].slice.call(arguments,
1)))}},h)})};b.fn.undelegate=function(a,b,f){return this.each(function(){d(this,b,f,a)})};b.fn.live=function(a,d){b(document.body).delegate(this.selector,a,d);return this};b.fn.die=function(a,d){b(document.body).undelegate(this.selector,a,d);return this};b.fn.on=function(a,d,f){return void 0==d||b.isFunction(d)?this.bind(a,d):this.delegate(d,a,f)};b.fn.off=function(a,d,f){return void 0==d||b.isFunction(d)?this.unbind(a,d):this.undelegate(d,a,f)};b.fn.trigger=function(a,d){"string"==typeof a&&(a=b.Event(a));
m(a);a.data=d;return this.each(function(){"dispatchEvent"in this&&this.dispatchEvent(a)})};b.fn.triggerHandler=function(a,d){var f,h;this.each(function(e,i){f=q("string"==typeof a?b.Event(a):a);f.data=d;f.target=i;b.each(j(i,a.type||a),function(a,b){h=b.proxy(f);if(f.isImmediatePropagationStopped())return!1})});return h};"focusin focusout load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout change select keydown keypress keyup error".split(" ").forEach(function(a){b.fn[a]=
function(b){return this.bind(a,b)}});["focus","blur"].forEach(function(a){b.fn[a]=function(b){if(b)this.bind(a,b);else if(this.length)try{this.get(0)[a]()}catch(d){}return this}});b.Event=function(a,b){var d=document.createEvent(A[a]||"Events"),f=!0;if(b)for(var h in b)"bubbles"==h?f=!!b[h]:d[h]=b[h];d.initEvent(a,f,!0,null,null,null,null,null,null,null,null,null,null,null,null);return d}})(k);(function(b){function e(b){var a=this.os={},f=this.browser={},e=b.match(/WebKit\/([\d.]+)/),d=b.match(/(Android)\s+([\d.]+)/),
q=b.match(/(iPad).*OS\s([\d_]+)/),m=!q&&b.match(/(iPhone\sOS)\s([\d_]+)/),h=b.match(/(webOS|hpwOS)[\s\/]([\d.]+)/),n=h&&b.match(/TouchPad/),A=b.match(/Kindle\/([\d.]+)/),l=b.match(/Silk\/([\d._]+)/),p=b.match(/(BlackBerry).*Version\/([\d.]+)/);if(f.webkit=!!e)f.version=e[1];d&&(a.android=!0,a.version=d[2]);m&&(a.ios=a.iphone=!0,a.version=m[2].replace(/_/g,"."));q&&(a.ios=a.ipad=!0,a.version=q[2].replace(/_/g,"."));h&&(a.webos=!0,a.version=h[2]);n&&(a.touchpad=!0);p&&(a.blackberry=!0,a.version=p[2]);
A&&(a.kindle=!0,a.version=A[1]);l&&(f.silk=!0,f.version=l[1]);!l&&(a.android&&b.match(/Kindle Fire/))&&(f.silk=!0)}e.call(b,navigator.userAgent);b.__detect=e})(k);var G=function(){function b(b){return Object.prototype.toString.call(b).slice(8,-1).toLowerCase()}var e=function(){e.cache.hasOwnProperty(arguments[0])||(e.cache[arguments[0]]=e.parse(arguments[0]));return e.format.call(null,e.cache[arguments[0]],arguments)};e.format=function(e,a){var f=1,i=e.length,d="",q=[],m,h,n,A;for(m=0;m<i;m++)if(d=
b(e[m]),"string"===d)q.push(e[m]);else if("array"===d){n=e[m];if(n[2]){d=a[f];for(h=0;h<n[2].length;h++){if(!d.hasOwnProperty(n[2][h]))throw G('[sprintf] property "%s" does not exist',n[2][h]);d=d[n[2][h]]}}else d=n[1]?a[n[1]]:a[f++];if(/[^s]/.test(n[8])&&"number"!=b(d))throw G("[sprintf] expecting number but found %s",b(d));switch(n[8]){case "b":d=d.toString(2);break;case "c":d=String.fromCharCode(d);break;case "d":d=parseInt(d,10);break;case "e":d=n[7]?d.toExponential(n[7]):d.toExponential();break;
case "f":d=n[7]?parseFloat(d).toFixed(n[7]):parseFloat(d);break;case "o":d=d.toString(8);break;case "s":d=(d=""+d)&&n[7]?d.substring(0,n[7]):d;break;case "u":d=Math.abs(d);break;case "x":d=d.toString(16);break;case "X":d=d.toString(16).toUpperCase()}d=/[def]/.test(n[8])&&n[3]&&0<=d?"+"+d:d;h=n[4]?"0"==n[4]?"0":n[4].charAt(1):" ";A=n[6]-(""+d).length;if(n[6]){for(var l=[];0<A;l[--A]=h);h=l.join("")}else h="";q.push(n[5]?d+h:h+d)}return q.join("")};e.cache={};e.parse=function(b){for(var a=[],f=[],e=
0;b;){if(null!==(a=/^[^\x25]+/.exec(b)))f.push(a[0]);else if(null!==(a=/^\x25{2}/.exec(b)))f.push("%");else if(null!==(a=/^\x25(?:([1-9]\d*)\$|\(([^\)]+)\))?(\+)?(0|'[^$])?(-)?(\d+)?(?:\.(\d+))?([b-fosuxX])/.exec(b))){if(a[2]){var e=e|1,d=[],q=a[2],m=[];if(null!==(m=/^([a-z_][a-z_\d]*)/i.exec(q)))for(d.push(m[1]);""!==(q=q.substring(m[0].length));)if(null!==(m=/^\.([a-z_][a-z_\d]*)/i.exec(q)))d.push(m[1]);else if(null!==(m=/^\[(\d+)\]/.exec(q)))d.push(m[1]);else throw"[sprintf] huh?";else throw"[sprintf] huh?";
a[2]=d}else e|=2;if(3===e)throw"[sprintf] mixing positional and named placeholders is not (yet) supported";f.push(a)}else throw"[sprintf] huh?";b=b.substring(a[0].length)}return f};return e}(),y;y||(y={});(function(){function b(a){return 10>a?"0"+a:a}function e(a){f.lastIndex=0;return f.test(a)?'"'+a.replace(f,function(a){var b=q[a];return"string"===typeof b?b:"\\u"+("0000"+a.charCodeAt(0).toString(16)).slice(-4)})+'"':'"'+a+'"'}function j(a,b){var f,l,p,g,q=i,k,s=b[a];"function"===typeof m&&(s=m.call(b,
a,s));switch(typeof s){case "string":return e(s);case "number":return isFinite(s)?""+s:"null";case "boolean":case "null":return""+s;case "object":if(!s)return"null";i+=d;k=[];if("[object Array]"===Object.prototype.toString.apply(s)){g=s.length;for(f=0;f<g;f+=1)k[f]=j(f,s)||"null";p=0===k.length?"[]":i?"[\n"+i+k.join(",\n"+i)+"\n"+q+"]":"["+k.join(",")+"]";i=q;return p}if(m&&"object"===typeof m){g=m.length;for(f=0;f<g;f+=1)"string"===typeof m[f]&&(l=m[f],(p=j(l,s))&&k.push(e(l)+(i?": ":":")+p))}else for(l in s)Object.prototype.hasOwnProperty.call(s,
l)&&(p=j(l,s))&&k.push(e(l)+(i?": ":":")+p);p=0===k.length?"{}":i?"{\n"+i+k.join(",\n"+i)+"\n"+q+"}":"{"+k.join(",")+"}";i=q;return p}}"function"!==typeof Date.prototype.toJSON&&(Date.prototype.toJSON=function(){return isFinite(this.valueOf())?this.getUTCFullYear()+"-"+b(this.getUTCMonth()+1)+"-"+b(this.getUTCDate())+"T"+b(this.getUTCHours())+":"+b(this.getUTCMinutes())+":"+b(this.getUTCSeconds())+"Z":null},String.prototype.toJSON=Number.prototype.toJSON=Boolean.prototype.toJSON=function(){return this.valueOf()});
var a=/[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,f=/[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,i,d,q={"\u0008":"\\b","\t":"\\t","\n":"\\n","\u000c":"\\f","\r":"\\r",'"':'\\"',"\\":"\\\\"},m;"function"!==typeof y.stringify&&(y.stringify=function(a,b,f){var e;d=i="";if(typeof f==="number")for(e=0;e<f;e=e+1)d=d+" ";else typeof f==="string"&&(d=f);if((m=b)&&typeof b!==
"function"&&(typeof b!=="object"||typeof b.length!=="number"))throw Error("JSON.stringify");return j("",{"":a})});"function"!==typeof y.parse&&(y.parse=function(b,d){function f(a,b){var e,h,i=a[b];if(i&&typeof i==="object")for(e in i)if(Object.prototype.hasOwnProperty.call(i,e)){h=f(i,e);h!==void 0?i[e]=h:delete i[e]}return d.call(a,b,i)}var e,b=""+b;a.lastIndex=0;a.test(b)&&(b=b.replace(a,function(a){return"\\u"+("0000"+a.charCodeAt(0).toString(16)).slice(-4)}));if(/^[\],:{}\s]*$/.test(b.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g,
"@").replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,"]").replace(/(?:^|:|,)(?:\s*\[)+/g,""))){e=eval("("+b+")");return typeof d==="function"?f({"":e},""):e}throw new SyntaxError("JSON.parse");})})();var I=[],O=1E3,E={},C={},u={},H="__msg_type",D="__callback_id",P="weixin://dispatch_message/",N={invoke:o,call:o,on:z,env:function(b){return u[b]},log:x,_fetchQueue:function(){var b=y.stringify(I);I=[];return b},_handleMessageFromWeixin:function(b){var e;switch(b[H]){case "callback":return"string"===
typeof b[D]&&"function"===typeof E[b[D]]?(e=E[b[D]](b.__params),delete E[b[D]],y.stringify(e)):y.stringify({__err_code:"cb404"});case "event":return"string"===typeof b.__event_id&&"function"===typeof C[b.__event_id]?(e=C[b.__event_id](b.__params),y.stringify(e)):y.stringify({__err_code:"ev404"})}return"{}"}};window.WeixinJSBridge?k.extend(window.WeixinJSBridge,N):window.WeixinJSBridge=N;(function(){function b(a,b){for(var e=document.elementFromPoint(a,b),d=e;d&&"IMG"!=d.tagName;)d=d.parentNode;if(!d)var k=
function(a,b){for(var d in a.childNodes){if(b(d))return d;k(d,b)}return null},d=k(e,function(a){return a&&"IMG"==a.tagName});return d&&"IMG"==d.tagName?d:null}z("menu:setfont",function(a){if("function"===typeof changefont)a=parseInt(a.fontSize),changefont(a);else if(!(a.isFirstAutoSet&&"2"===a.fontSize)){var b=u.system;if(!("string"===typeof b&&0<=b.indexOf("iPhone OS")&&4>=Number(b.substr(b.indexOf(".")-1,1)))){switch(a.fontSize){case "1":a="80%";break;case "2":a="100%";break;case "3":a="120%";break;
case "4":a="140%";break;default:return}document.getElementsByTagName("body")[0].style.webkitTextSizeAdjust=a}}});var e=function(a){var b=!1,e=function(d){b||(b=!0,a(d))},d=k("img");if(0==d.length)return e();for(var j={},m=[],h=0;h<d.length;h++){var n=d[h];if(!("none"==k(n).css("display")||"hidden"==k(n).css("visibility"))&&!j[n.src])j[n.src]=1,m.push(n)}for(var o=[],h=0;h<m.length&&100>h;h++)d=m[h],j=new Image,j.onload=function(){this.isLoaded=!0;for(var a=0,b=0;b<o.length;b++){var d=o[b];if(!d.isLoaded)break;
a++;if(290<d.width&&290<d.height){e(d);break}}a==o.length&&e()},j.src=d.src,o.push(j);setTimeout(function(){for(var a=0;a<o.length;a++){var b=o[a];if(b.isLoaded&&290<b.width&&290<b.height){e(b);return}}e()},1E3)};z("menu:share:timeline",function(a){x("share timeline");var b;"string"===typeof a.title?(b=a,o("shareTimeline",b)):(b={link:document.documentURI||u.init_url,desc:document.documentURI||u.init_url,title:document.title},e(function(a){a&&(b.img_url=a.src,b.img_width=a.width,b.img_height=a.height);
o("shareTimeline",b)}))});var j=function(a){x("share weibo");var b;b="string"===typeof a.content?a:{content:document.title,type:"link",title:document.title,link:document.documentURI||u.short_url||u.init_url};e(function(a){a&&(b.img_url=a.src);o("shareWeibo",b)})};z("menu:share:weibo",j);z("general:share",function(a){x("general share");var b=function(b,e){"weibo"===a.shareTo&&o("shareWeibo",b,function(a){a.err_msg="share_weibo:ok"===a.err_msg?"general_share:ok":"share_weibo:cancel"===a.err_msg?"general_share:cancel":
"general_share:fail";e(a)});if("friend"===a.shareTo||"favorite"===a.shareTo||"connector"===a.shareTo){b.img_width=0;b.img_height=0;var f=function(a){a.err_msg="send_app_msg:confirm"===a.err_msg?"general_share:ok":"send_app_msg:cancel"===a.err_msg?"general_share:cancel":"general_share:fail";e(a)};b.img_url?F(b.img_url,function(a){b.img_width=a.width;b.img_height=a.height;o("sendAppMessage",b,f)}):o("sendAppMessage",b,f)}"timeline"===a.shareTo&&(f=function(a){a.err_msg="share_timeline:ok"===a.err_msg?
"general_share:ok":"share_timeline:cancel"===a.err_msg?"general_share:cancel":"general_share:fail";e(a)},b.img_width=0,b.img_height=0,b.img_url?F(b.img_url,function(a){b.img_width=a.width;b.img_height=a.height;o("shareTimeline",b,f)}):o("shareTimeline",b,f))},e=function(){x("general share failed. fallback to original share"+a.shareTo);"weibo"===a.shareTo&&B("menu:share:weibo",a);("friend"===a.shareTo||"favorite"===a.shareTo||"connector"===a.shareTo)&&B("menu:share:appmessage",a);"timeline"===a.shareTo&&
B("menu:share:timeline",a)};"function"===typeof C["menu:general:share"]?(a.generalShare=b,B("menu:general:share",a)):"weibo"===a.shareTo&&C["menu:share:weibo"]!=j?B("menu:share:weibo",a):("friend"===a.shareTo||"favorite"===a.shareTo||"connector"===a.shareTo)&&C["menu:share:appmessage"]!=j?B("menu:share:appmessage",a):"timeline"===a.shareTo&&C["menu:share:timeline"]!=j?B("menu:share:timeline",a):(b={$:k,fail:e,success:b},x("try default share handler"),B("__internal:get_share_object",b))});z("menu:share:appmessage",
function(a){x("share appmessage");var b;"string"===typeof a.title?(b=a,o("sendAppMessage",b)):(b={link:document.documentURI||u.init_url,desc:document.documentURI||u.init_url,title:document.title},e(function(a){a&&(b.img_url=a.src,b.img_width=a.width,b.img_height=a.height);o("sendAppMessage",b)}))});z("menu:share:email",function(a){x("share email");o("sendEmail","string"===typeof a.title?a:{content:document.documentURI||u.init_url,title:document.title})});z("menu:share:facebook",function(a){x("share facebook");
var b;"string"===typeof a.title?(b=a,o("shareFB",b)):(b={link:document.documentURI||u.init_url,desc:document.documentURI||u.init_url,title:document.title},e(function(a){a&&(b.img_url=a.src,b.img_width=a.width,b.img_height=a.height);o("shareFB",b)}))});z("ui:longpress",function(a){x("longpress at ("+a.x+","+a.y+")");var e=b(a.x,a.y);e?Q(e,function(a,b){o("saveImage",{base64DataString:a,url:b.src})}):x("cannot find image at ("+a.x+","+a.y+")")});z("sys:init",function(a){u=a;a=document.createEvent("Events");
a.initEvent("WeixinJSBridgeReady");document.dispatchEvent(a)});z("sys:bridged",function(){"1"===u.webview_type&&B("menu:setfont",{fontSize:u.init_font_size,isFirstAutoSet:1});try{R(),S(),T()}catch(a){x("error %s",a)}})})();k.JSON=y;k.disableImageSelection=function(){for(var b=k("img"),e=0;e<b.length;e++)k(b[e])._wxjs_old_touch_callout=k(b[e]).css("-webkit-touch-callout"),k(b[e])._wxjs_old_user_select=k(b[e]).css("-webkit-user-select");k("img").css({"-webkit-touch-callout":"none","-webkit-user-select":"none"})};
k.restoreImageSelection=function(){for(var b=k("img"),e=0;e<b.length;e++)"undefined"!=typeof k(b[e])._wxjs_old_touch_callout&&k(b[e]).css({"-webkit-touch-callout":k(b[e])._wxjs_old_touch_callout,"-webkit-user-select":k(b[e])._wxjs_old_user_select})};k.disableAlertView=function(){window.__wxjs_sys_alert=window.alert;window.alert=null;window.__wxjs_sys_prompt=window.prompt;window.prompt=null};k.restoreAlertView=function(){window.alert=window.__wxjs_sys_alert;window.prompt=window.__wxjs_sys_prompt;delete window.__wxjs_sys_alert;
delete window.__wxjs_sys_prompt}})();
