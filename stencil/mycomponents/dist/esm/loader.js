import { p as promiseResolve, b as bootstrapLazy } from './index-cc055875.js';
export { s as setNonce } from './index-cc055875.js';

/*
 Stencil Client Patch Esm v3.3.1 | MIT Licensed | https://stenciljs.com
 */
const patchEsm = () => {
    return promiseResolve();
};

const defineCustomElements = (win, options) => {
  if (typeof window === 'undefined') return Promise.resolve();
  return patchEsm().then(() => {
  return bootstrapLazy([["title-component",[[1,"title-component",{"size":[1],"text":[1],"color":[1]}]]]], options);
  });
};

export { defineCustomElements };

//# sourceMappingURL=loader.js.map