import type { Components, JSX } from "../types/components";

interface TitleComponent extends Components.TitleComponent, HTMLElement {}
export const TitleComponent: {
  prototype: TitleComponent;
  new (): TitleComponent;
};
/**
 * Used to define this component and all nested components recursively.
 */
export const defineCustomElement: () => void;
