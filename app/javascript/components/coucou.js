

const test = () => {
  const iframe = document.querySelector('iframe');
  const i = iframe.contentWindow.document.querySelector('body');
  console.log(i);

}


export {test};
