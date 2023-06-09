'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

const index = require('./index-78953a33.js');

const titleComponentCss = ":host{font-family:sans-serif;font-weight:bold;font-size:24px}:h1{font-size:24px}:h2{font-size:20px}:h3{font-size:18px}:h4{font-size:16px}:h5{font-size:14px}:h6{font-size:12px}p[color=\"white\"]{color:white}p[color=\"black\"]{color:black}";

const TitleComponent = class {
  constructor(hostRef) {
    index.registerInstance(this, hostRef);
    this.size = undefined;
    this.text = undefined;
    this.color = undefined;
  }
  render() {
    const Tag = this.size;
    return (index.h(Tag, null, index.h("slot", null, index.h("p", { color: this.color }, this.text))));
  }
};
TitleComponent.style = titleComponentCss;

exports.title_component = TitleComponent;

//# sourceMappingURL=title-component.cjs.entry.js.map