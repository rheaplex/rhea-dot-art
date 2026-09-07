# rhea.art

Zola site. Styles are Tailwind CSS v4 compiled once with the standalone CLI and committed.

    zola build                                             # or: zola serve
    tailwindcss -i styles/site.css -o static/css/site.css --minify   # after editing templates/ or styles/

Tools: zola 0.23+, tailwindcss standalone CLI 4.x (both single binaries in ~/.local/bin). No Node.
