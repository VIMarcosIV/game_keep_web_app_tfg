import { h } from '@stencil/core';
export class TitleComponent {
  constructor() {
    this.size = undefined;
    this.text = undefined;
    this.color = undefined;
  }
  render() {
    const Tag = this.size;
    return (h(Tag, null, h("slot", null, h("p", { color: this.color }, this.text))));
  }
  static get is() { return "title-component"; }
  static get encapsulation() { return "shadow"; }
  static get originalStyleUrls() {
    return {
      "$": ["title-component.css"]
    };
  }
  static get styleUrls() {
    return {
      "$": ["title-component.css"]
    };
  }
  static get properties() {
    return {
      "size": {
        "type": "string",
        "mutable": false,
        "complexType": {
          "original": "'h1' | 'h2' | 'h3' | 'h4' | 'h5' | 'h6'",
          "resolved": "\"h1\" | \"h2\" | \"h3\" | \"h4\" | \"h5\" | \"h6\"",
          "references": {}
        },
        "required": false,
        "optional": false,
        "docs": {
          "tags": [],
          "text": ""
        },
        "attribute": "size",
        "reflect": false
      },
      "text": {
        "type": "string",
        "mutable": false,
        "complexType": {
          "original": "string",
          "resolved": "string",
          "references": {}
        },
        "required": false,
        "optional": false,
        "docs": {
          "tags": [],
          "text": ""
        },
        "attribute": "text",
        "reflect": false
      },
      "color": {
        "type": "string",
        "mutable": false,
        "complexType": {
          "original": "string",
          "resolved": "string",
          "references": {}
        },
        "required": false,
        "optional": false,
        "docs": {
          "tags": [],
          "text": ""
        },
        "attribute": "color",
        "reflect": false
      }
    };
  }
}
//# sourceMappingURL=title-component.js.map
