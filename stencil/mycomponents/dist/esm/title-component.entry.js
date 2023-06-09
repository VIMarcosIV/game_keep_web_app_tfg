import { r as registerInstance, h } from './index-cc055875.js';

const titleComponentCss = ":host{font-family:sans-serif;font-weight:bold;font-size:24px}:h1{font-size:24px}:h2{font-size:20px}:h3{font-size:18px}:h4{font-size:16px}:h5{font-size:14px}:h6{font-size:12px}p[color=\"white\"]{color:white}p[color=\"black\"]{color:black}";

const TitleComponent = class {
  constructor(hostRef) {
    registerInstance(this, hostRef);
    this.size = undefined;
    this.text = undefined;
    this.color = undefined;
  }
  render() {
    const Tag = this.size;
    return (h(Tag, null, h("slot", null, h("p", { color: this.color }, this.text))));
  }
};
TitleComponent.style = titleComponentCss;

export { TitleComponent as title_component };

//# sourceMappingURL=title-component.entry.js.map