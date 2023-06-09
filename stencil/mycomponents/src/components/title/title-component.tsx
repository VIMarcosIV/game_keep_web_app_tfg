import { Component, h, Prop } from '@stencil/core';

@Component({
  tag: 'title-component',
  styleUrl: 'title-component.css',
  shadow: true,
})
export class TitleComponent {
  @Prop() size: 'h1' | 'h2' | 'h3' | 'h4' | 'h5' | 'h6';
  @Prop() text: string;
  @Prop() color: string;
  render() {
    const Tag = this.size;
    return (
      <Tag>
        <slot >
          <p color={this.color}>{this.text}</p></slot>
      </Tag>
    );
  }
}
