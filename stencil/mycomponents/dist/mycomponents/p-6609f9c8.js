const t="mycomponents";let n;let e;let s=false;let o=false;const l=(t,n="")=>{{return()=>{}}};const c=(t,n)=>{{return()=>{}}};const i="{visibility:hidden}.hydrated{visibility:inherit}";const f={};const r=t=>t!=null;const u=t=>{t=typeof t;return t==="object"||t==="function"};function a(t){var n,e,s;return(s=(e=(n=t.head)===null||n===void 0?void 0:n.querySelector('meta[name="csp-nonce"]'))===null||e===void 0?void 0:e.getAttribute("content"))!==null&&s!==void 0?s:undefined}const d=(t,n,...e)=>{let s=null;let o=false;let l=false;const c=[];const i=n=>{for(let e=0;e<n.length;e++){s=n[e];if(Array.isArray(s)){i(s)}else if(s!=null&&typeof s!=="boolean"){if(o=typeof t!=="function"&&!u(s)){s=String(s)}if(o&&l){c[c.length-1].t+=s}else{c.push(o?h(null,s):s)}l=o}}};i(e);if(typeof t==="function"){return t(n===null?{}:n,c,m)}const f=h(t,null);f.o=n;if(c.length>0){f.l=c}return f};const h=(t,n)=>{const e={i:0,u:t,t:n,h:null,l:null};{e.o=null}return e};const p={};const y=t=>t&&t.u===p;const m={forEach:(t,n)=>t.map($).forEach(n),map:(t,n)=>t.map($).map(n).map(w)};const $=t=>({vattrs:t.o,vchildren:t.l,vkey:t.p,vname:t.m,vtag:t.u,vtext:t.t});const w=t=>{if(typeof t.vtag==="function"){const n=Object.assign({},t.vattrs);if(t.vkey){n.key=t.vkey}if(t.vname){n.name=t.vname}return d(t.vtag,n,...t.vchildren||[])}const n=h(t.vtag,t.vtext);n.o=t.vattrs;n.l=t.vchildren;n.p=t.vkey;n.m=t.vname;return n};const b=(t,n)=>{if(t!=null&&!u(t)){if(n&1){return String(t)}return t}return t};const v=(t,n,e)=>{const s=rt.ce(n,e);t.dispatchEvent(s);return s};const S=new WeakMap;const g=(t,n,e)=>{let s=ct.get(t);if(at&&e){s=s||new CSSStyleSheet;if(typeof s==="string"){s=n}else{s.replaceSync(n)}}else{s=n}ct.set(t,s)};const j=(t,n,e,s)=>{var o;let l=M(n);const c=ct.get(l);t=t.nodeType===11?t:ft;if(c){if(typeof c==="string"){t=t.head||t;let n=S.get(t);let e;if(!n){S.set(t,n=new Set)}if(!n.has(l)){{{e=ft.createElement("style");e.innerHTML=c}const n=(o=rt.$)!==null&&o!==void 0?o:a(ft);if(n!=null){e.setAttribute("nonce",n)}t.insertBefore(e,t.querySelector("link"))}if(n){n.add(l)}}}else if(!t.adoptedStyleSheets.includes(c)){t.adoptedStyleSheets=[...t.adoptedStyleSheets,c]}}return l};const k=t=>{const n=t.v;const e=t.S;const s=n.i;const o=l("attachStyles",n.g);const c=j(e.shadowRoot?e.shadowRoot:e.getRootNode(),n);if(s&10){e["s-sc"]=c;e.classList.add(c+"-h")}o()};const M=(t,n)=>"sc-"+t.g;const C=(t,n,e,s,o,l)=>{if(e!==s){let c=et(t,n);n.toLowerCase();{const i=u(s);if((c||i&&s!==null)&&!o){try{if(!t.tagName.includes("-")){const o=s==null?"":s;if(n==="list"){c=false}else if(e==null||t[n]!=o){t[n]=o}}else{t[n]=s}}catch(t){}}if(s==null||s===false){if(s!==false||t.getAttribute(n)===""){{t.removeAttribute(n)}}}else if((!c||l&4||o)&&!i){s=s===true?"":s;{t.setAttribute(n,s)}}}}};const O=(t,n,e,s)=>{const o=n.h.nodeType===11&&n.h.host?n.h.host:n.h;const l=t&&t.o||f;const c=n.o||f;{for(s in l){if(!(s in c)){C(o,s,l[s],undefined,e,n.i)}}}for(s in c){C(o,s,l[s],c[s],e,n.i)}};const P=(t,e,o,l)=>{const c=e.l[o];let i=0;let f;let u;if(c.t!==null){f=c.h=ft.createTextNode(c.t)}else{f=c.h=ft.createElement(c.u);{O(null,c,s)}if(r(n)&&f["s-si"]!==n){f.classList.add(f["s-si"]=n)}if(c.l){for(i=0;i<c.l.length;++i){u=P(t,c,i);if(u){f.appendChild(u)}}}}return f};const x=(t,n,s,o,l,c)=>{let i=t;let f;if(i.shadowRoot&&i.tagName===e){i=i.shadowRoot}for(;l<=c;++l){if(o[l]){f=P(null,s,l);if(f){o[l].h=f;i.insertBefore(f,n)}}}};const E=(t,n,e)=>{for(let s=n;s<=e;++s){const n=t[s];if(n){const t=n.h;if(t){t.remove()}}}};const U=(t,n,e,s)=>{let o=0;let l=0;let c=n.length-1;let i=n[0];let f=n[c];let r=s.length-1;let u=s[0];let a=s[r];let d;while(o<=c&&l<=r){if(i==null){i=n[++o]}else if(f==null){f=n[--c]}else if(u==null){u=s[++l]}else if(a==null){a=s[--r]}else if(N(i,u)){T(i,u);i=n[++o];u=s[++l]}else if(N(f,a)){T(f,a);f=n[--c];a=s[--r]}else if(N(i,a)){T(i,a);t.insertBefore(i.h,f.h.nextSibling);i=n[++o];a=s[--r]}else if(N(f,u)){T(f,u);t.insertBefore(f.h,i.h);f=n[--c];u=s[++l]}else{{d=P(n&&n[l],e,l);u=s[++l]}if(d){{i.h.parentNode.insertBefore(d,i.h)}}}}if(o>c){x(t,s[r+1]==null?null:s[r+1].h,e,s,l,r)}else if(l>r){E(n,o,c)}};const N=(t,n)=>{if(t.u===n.u){return true}return false};const T=(t,n)=>{const e=n.h=t.h;const o=t.l;const l=n.l;const c=n.u;const i=n.t;if(i===null){{if(c==="slot");else{O(t,n,s)}}if(o!==null&&l!==null){U(e,o,n,l)}else if(l!==null){if(t.t!==null){e.textContent=""}x(e,null,n,l,0,l.length-1)}else if(o!==null){E(o,0,o.length-1)}}else if(t.t!==i){e.data=i}};const A=(t,s)=>{const o=t.S;const l=t.j||h(null,null);const c=y(s)?s:d(null,null,s);e=o.tagName;c.u=null;c.i|=4;t.j=c;c.h=l.h=o.shadowRoot||o;{n=o["s-sc"]}T(l,c)};const L=(t,n)=>{if(n&&!t.k&&n["s-p"]){n["s-p"].push(new Promise((n=>t.k=n)))}};const R=(t,n)=>{{t.i|=16}if(t.i&4){t.i|=512;return}L(t,t.M);const e=()=>W(t,n);return wt(e)};const W=(t,n)=>{const e=l("scheduleUpdate",t.v.g);const s=t.C;let o;e();return q(o,(()=>F(t,s,n)))};const q=(t,n)=>t instanceof Promise?t.then(n):n();const F=async(t,n,e)=>{var s;const o=t.S;const c=l("update",t.v.g);const i=o["s-rc"];if(e){k(t)}const f=l("render",t.v.g);{H(t,n)}if(i){i.map((t=>t()));o["s-rc"]=undefined}f();c();{const n=(s=o["s-p"])!==null&&s!==void 0?s:[];const e=()=>I(t);if(n.length===0){e()}else{Promise.all(n).then(e);t.i|=4;n.length=0}}};const H=(t,n,e)=>{try{n=n.render();{t.i&=~16}{t.i|=2}{{{A(t,n)}}}}catch(n){st(n,t.S)}return null};const I=t=>{const n=t.v.g;const e=t.S;const s=l("postUpdate",n);const o=t.M;if(!(t.i&64)){t.i|=64;{_(e)}s();{t.O(e);if(!o){V()}}}else{s()}{if(t.k){t.k();t.k=undefined}if(t.i&512){$t((()=>R(t,false)))}t.i&=~(4|512)}};const V=n=>{{_(ft.documentElement)}$t((()=>v(it,"appload",{detail:{namespace:t}})))};const _=t=>t.classList.add("hydrated");const z=(t,n)=>Z(t).P.get(n);const B=(t,n,e,s)=>{const o=Z(t);const l=o.P.get(n);const c=o.i;const i=o.C;e=b(e,s.U[n][0]);const f=Number.isNaN(l)&&Number.isNaN(e);const r=e!==l&&!f;if((!(c&8)||l===undefined)&&r){o.P.set(n,e);if(i){if((c&(2|16))===2){R(o,false)}}}};const D=(t,n,e)=>{if(n.U){const s=Object.entries(n.U);const o=t.prototype;s.map((([t,[s]])=>{if(s&31||e&2&&s&32){Object.defineProperty(o,t,{get(){return z(this,t)},set(e){B(this,t,e,n)},configurable:true,enumerable:true})}}));if(e&1){const n=new Map;o.attributeChangedCallback=function(t,e,s){rt.jmp((()=>{const e=n.get(t);if(this.hasOwnProperty(e)){s=this[e];delete this[e]}else if(o.hasOwnProperty(e)&&typeof this[e]==="number"&&this[e]==s){return}this[e]=s===null&&typeof this[e]==="boolean"?false:s}))};t.observedAttributes=s.filter((([t,n])=>n[0]&15)).map((([t,e])=>{const s=e[1]||t;n.set(s,t);return s}))}}return t};const G=async(t,n,e,s,o)=>{if((n.i&32)===0){n.i|=32;{o=lt(e);if(o.then){const t=c();o=await o;t()}if(!o.isProxied){D(o,e,2);o.isProxied=true}const t=l("createInstance",e.g);{n.i|=8}try{new o(n)}catch(t){st(t)}{n.i&=~8}t()}if(o.style){let t=o.style;const n=M(e);if(!ct.has(n)){const s=l("registerStyles",e.g);g(n,t,!!(e.i&1));s()}}}const i=n.M;const f=()=>R(n,true);if(i&&i["s-rc"]){i["s-rc"].push(f)}else{f()}};const J=t=>{if((rt.i&1)===0){const n=Z(t);const e=n.v;const s=l("connectedCallback",e.g);if(!(n.i&1)){n.i|=1;{let e=t;while(e=e.parentNode||e.host){if(e["s-p"]){L(n,n.M=e);break}}}if(e.U){Object.entries(e.U).map((([n,[e]])=>{if(e&31&&t.hasOwnProperty(n)){const e=t[n];delete t[n];t[n]=e}}))}{G(t,n,e)}}s()}};const K=t=>{if((rt.i&1)===0){Z(t)}};const Q=(t,n={})=>{var e;const s=l();const o=[];const c=n.exclude||[];const f=it.customElements;const r=ft.head;const u=r.querySelector("meta[charset]");const d=ft.createElement("style");const h=[];let p;let y=true;Object.assign(rt,n);rt.N=new URL(n.resourcesUrl||"./",ft.baseURI).href;t.map((t=>{t[1].map((n=>{const e={i:n[0],g:n[1],U:n[2],T:n[3]};{e.U=n[2]}const s=e.g;const l=class extends HTMLElement{constructor(t){super(t);t=this;nt(t,e);if(e.i&1){{{t.attachShadow({mode:"open"})}}}}connectedCallback(){if(p){clearTimeout(p);p=null}if(y){h.push(this)}else{rt.jmp((()=>J(this)))}}disconnectedCallback(){rt.jmp((()=>K(this)))}componentOnReady(){return Z(this).A}};e.L=t[0];if(!c.includes(s)&&!f.get(s)){o.push(s);f.define(s,D(l,e,1))}}))}));{d.innerHTML=o+i;d.setAttribute("data-styles","");const t=(e=rt.$)!==null&&e!==void 0?e:a(ft);if(t!=null){d.setAttribute("nonce",t)}r.insertBefore(d,u?u.nextSibling:r.firstChild)}y=false;if(h.length){h.map((t=>t.connectedCallback()))}else{{rt.jmp((()=>p=setTimeout(V,30)))}}s()};const X=t=>rt.$=t;const Y=new WeakMap;const Z=t=>Y.get(t);const tt=(t,n)=>Y.set(n.C=t,n);const nt=(t,n)=>{const e={i:0,S:t,v:n,P:new Map};{e.A=new Promise((t=>e.O=t));t["s-p"]=[];t["s-rc"]=[]}return Y.set(t,e)};const et=(t,n)=>n in t;const st=(t,n)=>(0,console.error)(t,n);const ot=new Map;const lt=(t,n,e)=>{const s=t.g.replace(/-/g,"_");const o=t.L;const l=ot.get(o);if(l){return l[s]}
/*!__STENCIL_STATIC_IMPORT_SWITCH__*/return import(`./${o}.entry.js${""}`).then((t=>{{ot.set(o,t)}return t[s]}),st)};const ct=new Map;const it=typeof window!=="undefined"?window:{};const ft=it.document||{head:{}};const rt={i:0,N:"",jmp:t=>t(),raf:t=>requestAnimationFrame(t),ael:(t,n,e,s)=>t.addEventListener(n,e,s),rel:(t,n,e,s)=>t.removeEventListener(n,e,s),ce:(t,n)=>new CustomEvent(t,n)};const ut=t=>Promise.resolve(t);const at=(()=>{try{new CSSStyleSheet;return typeof(new CSSStyleSheet).replaceSync==="function"}catch(t){}return false})();const dt=[];const ht=[];const pt=(t,n)=>e=>{t.push(e);if(!o){o=true;if(n&&rt.i&4){$t(mt)}else{rt.raf(mt)}}};const yt=t=>{for(let n=0;n<t.length;n++){try{t[n](performance.now())}catch(t){st(t)}}t.length=0};const mt=()=>{yt(dt);{yt(ht);if(o=dt.length>0){rt.raf(mt)}}};const $t=t=>ut().then(t);const wt=pt(ht,true);export{Q as b,d as h,ut as p,tt as r,X as s};
//# sourceMappingURL=p-6609f9c8.js.map