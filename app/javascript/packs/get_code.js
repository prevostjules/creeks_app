const getCode = () => {
    const lien = window.location.href;
    if (lien.match(/code=/)) {
      const t = lien.split('code=')[1];
      console.log(t.split("&")[0]);
    };
}

export { getCode };
