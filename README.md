# Resume

This repository contains the source and generated PDF for my professional resume.

## Download

[Download the latest resume PDF](./Tulio-Anjos-Senior-Software-Engineer-Resume.pdf)

## Source

The canonical resume source is:

```text
resume.typ
```

The PDF is generated with the Typst CLI.

## Build locally

Install Typst, then run:

```bash
typst compile resume.typ Tulio-Anjos-Senior-Software-Engineer-Resume.pdf --input paper=a4
```

## GitHub Actions

The resume PDF is built automatically on pushes and pull requests.

On pushes to `main`, the generated PDF is committed back to the repository when it changes.

## Files

```text
resume.typ
Tulio-Anjos-Senior-Software-Engineer-Resume.pdf
.github/workflows/resume.yml
LICENSE
```

## License

© 2026 Túlio Ribeiro dos Anjos. All rights reserved.

This repository contains my personal resume, professional history, biographical information, and generated resume PDF. It is public for professional evaluation only. The content is not licensed for reuse.
