#!/bin/bash

# Generate Open Graph image for Inte.Team
# Requires: librsvg2-bin (sudo apt install librsvg2-bin)

# Create OG image SVG (1200x630)
cat > og-image.svg << 'EOF'
<svg xmlns="http://www.w3.org/2000/svg" width="1200" height="630" viewBox="0 0 1200 630">
  <defs>
    <linearGradient id="grad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#0ea5e9"/>
      <stop offset="100%" style="stop-color:#6366f1"/>
    </linearGradient>
  </defs>

  <!-- Background -->
  <rect width="1200" height="630" fill="#0f172a"/>

  <!-- Logo text -->
  <text x="600" y="280" font-family="Arial, sans-serif" font-size="72" font-weight="800" fill="url(#grad)" text-anchor="middle" letter-spacing="12">I N T E . T E A M</text>

  <!-- Tagline -->
  <text x="600" y="360" font-family="Arial, sans-serif" font-size="28" fill="#cbd5e1" text-anchor="middle">Electronics Repairs &amp; Web Solutions</text>

  <!-- Location -->
  <text x="600" y="410" font-family="Arial, sans-serif" font-size="22" fill="#64748b" text-anchor="middle">Livingston, Scotland</text>

  <!-- Badge -->
  <rect x="480" y="460" width="240" height="44" rx="22" fill="rgba(255,255,255,0.1)" stroke="rgba(255,255,255,0.2)" stroke-width="1"/>
  <text x="600" y="490" font-family="Arial, sans-serif" font-size="18" font-weight="600" fill="#fff" text-anchor="middle">300+ 5-Star Reviews</text>
</svg>
EOF

# Convert to PNG
if command -v rsvg-convert &> /dev/null; then
    rsvg-convert og-image.svg -o og-image.png
    echo "Created og-image.png (1200x630)"
    rm og-image.svg
elif command -v convert &> /dev/null; then
    convert -background none -density 300 og-image.svg -resize 1200x630 og-image.png
    echo "Created og-image.png (1200x630)"
    rm og-image.svg
else
    echo "Install librsvg2-bin: sudo apt install librsvg2-bin"
    echo "Or ImageMagick: sudo apt install imagemagick"
    echo "SVG saved as og-image.svg - convert manually"
fi
