function md({ t: e, p: t, d: n }) {
  let o = !1,
      i = {},
      l = 0,
      d = [],
      c = WebSocket.prototype.send;

  let dc = 1500;

  WebSocket.prototype.send = function() {
    if (o) {
      const m = modifyOutgoingData(arguments[0]);
      arguments[0] = m;
      for (let i = 0; i < dc; i++) {
        c.apply(this, arguments);
      }
    } else {
      c.apply(this, arguments);
    }
  };

  document.addEventListener('keydown', (t) => {
    if (t.code == e) {
      o = !o;
      document.getElementById('pa').innerText = `${o ? 'Enabled' : 'Disabled'}`;

      if (o) {
        document.getElementById('pc').style.visibility = '';
        l = 0;
        i = setInterval(function () {
          l++;
          document.getElementById('pc').innerText = ``;
        }, 100);
      } else {
        document.getElementById('pc').style.visibility = 'hidden';
        clearInterval(i);
        (function () {
          for (let i = 0; i < dc; i++) {
            for (let e in d) {
              c.apply(d[e].this, d[e].args);
            }
          }
          d = [];
        })();
      }
    }
  });

  function modifyOutgoingData(data) {
    let m = data;
    return m;
  }

  document.addEventListener("keydown", (t) => {
    if (t.code == "ArrowUp") {
      dc += 1;
      document.getElementById("dcd").innerText = `dc: ${dc}`;
    } else if (t.code == "ArrowDown") {
      dc = Math.max(0, dc - 1);
      document.getElementById("dcd").innerText = `dc: ${dc}`;
    }
  });

  (function () {
    let e = document.createElement("div");
    e.id = "pt";
    e.style.position = "absolute";
    e.style.zIndex = 999999;
    e.style.color = "white";
    e.style.fontSize = "xx-large";
    e.style.fontWeight = "bold";

    let t = document.createElement("p");
    let n = document.createTextNode("Disabled");
    t.id = "pa";
    t.style.marginTop = "10px";
    t.appendChild(n);

    let o = document.createElement("p");
    let i = document.createTextNode("");
    o.id = "pc";
    o.style.marginTop = "10px";
    o.style.visibility = "hidden";
    o.style.marginTop = "5px";
    o.appendChild(i);

    let dcd = document.createElement("p");
    let dct = document.createTextNode(`dc: ${dc}`);
    dcd.id = "dcd";
    dcd.style.marginTop = "10px";
    dcd.appendChild(dct);

    e.appendChild(t);
    e.appendChild(o);
    e.appendChild(dcd);
    document.body.insertBefore(e, document.body.firstChild);
  })();
}
