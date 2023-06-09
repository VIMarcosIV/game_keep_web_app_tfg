import { proxyCustomElement, HTMLElement, h } from '@stencil/core/internal/client';

const titleComponentCss = ":host{font-family:sans-serif;font-weight:bold;font-size:24px}:h1{font-size:24px}:h2{font-size:20px}:h3{font-size:18px}:h4{font-size:16px}:h5{font-size:14px}:h6{font-size:12px}p[color=\"white\"]{color:white}p[color=\"black\"]{color:black}";

const TitleComponent$1 = /*@__PURE__*/ proxyCustomElement(class TitleComponent extends HTMLElement {
  constructor() {
    super();
    this.__registerHost();
    this.__attachShadow();
    this.size = undefined;
    this.text = undefined;
    this.color = undefined;
  }
  render() {
    const Tag = this.size;
    return (h(Tag, null, h("slot", null, h("p", { color: this.color }, this.text))));
  }
  static get style() { return titleComponentCss; }
}, [1, "title-component", {
    "size": [1],
    "text": [1],
    "color": [1]
  }]);
function defineCustomElement$1() {
  if (typeof customElements === "undefined") {
    return;
  }
  const components = ["title-component"];
  components.forEach(tagName => { switch (tagName) {
    case "title-component":
      if (!customElements.get(tagName)) {
        customElements.define(tagName, TitleComponent$1);
      }
      break;
  } });
}

const TitleComponent = TitleComponent$1;
const defineCustomElement = defineCustomElement$1;

export { TitleComponent, defineCustomElement };

//# sourceMappingURL=title-component.js.map