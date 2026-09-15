# Prepara os assets do portfolio: redimensiona e recomprime.
# Uso: powershell -File build-assets.ps1
Add-Type -AssemblyName System.Drawing

$dest = "D:\CLAUDE\projects\julia-nunes-portfolio\dev\site\assets"
$dl   = "C:\Users\Danilo\Downloads"

# ATENCAO: os recortes com fundo transparente sao achatados em JPG sobre a cor
# exata da secao onde aparecem no index.html. Se a cor de fundo da secao mudar,
# rode este script de novo com o novo valor de -bg.
function Convert-Img {
    param($src, $out, [int]$maxW, [string]$fmt = "png", [int]$quality = 82, [string]$bg = "#FFFFFF")
    if (-not (Test-Path $src)) { Write-Host "FALTA: $src"; return }
    $img = [System.Drawing.Image]::FromFile($src)
    $w = $img.Width; $h = $img.Height
    if ($w -gt $maxW) { $nw = $maxW; $nh = [int][Math]::Round($h * $maxW / $w) } else { $nw = $w; $nh = $h }

    $bmp = New-Object System.Drawing.Bitmap $nw, $nh, ([System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.InterpolationMode  = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g.SmoothingMode      = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    $g.PixelOffsetMode    = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
    $g.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
    if ($fmt -eq "jpg") { $g.Clear([System.Drawing.ColorTranslator]::FromHtml($bg)) }
    $g.DrawImage($img, (New-Object System.Drawing.Rectangle 0, 0, $nw, $nh))
    $g.Dispose(); $img.Dispose()

    if ($fmt -eq "jpg") {
        $codec = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq "image/jpeg" }
        $ep = New-Object System.Drawing.Imaging.EncoderParameters 1
        $ep.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter ([System.Drawing.Imaging.Encoder]::Quality), ([long]$quality)
        $bmp.Save($out, $codec, $ep)
    } else {
        $bmp.Save($out, [System.Drawing.Imaging.ImageFormat]::Png)
    }
    $bmp.Dispose()
    $kb = [Math]::Round((Get-Item $out).Length / 1KB)
    Write-Host ("{0,-22} {1}x{2}  {3} KB" -f (Split-Path $out -Leaf), $nw, $nh, $kb)
}

# --- Recortes achatados sobre a cor da secao (JPG) ---
Convert-Img "$dl\julia hero.png"           "$dest\hero-julia.jpg"    1283 "jpg" 86 "#FFFFFF"   # secao hero: branco
Convert-Img "$dl\julai - bio.png"          "$dest\sobre-julia.jpg"    960 "jpg" 86 "#FFFFFF"   # secao sobre: branco
Convert-Img "$dl\julia - ultima dobra.png" "$dest\cta-cadeira.jpg"   1040 "jpg" 86 "#FFFFFF"   # card branco dentro da secao rosa

# --- Foto com fundo solido (JPG) ---
Convert-Img "$dl\d958eebd-77a3-4cff-a435-df59cfeb5799.png" "$dest\bonito-funcao.jpg" 1120 "jpg" 86

# --- Screenshots dos projetos (JPG) ---
Convert-Img "$dest\raw-cbi14.png" "$dest\work-cbi.jpg" 900 "jpg" 80
Convert-Img "D:\CLAUDE\projects\metaforando-pam\delivery\2026-07-23_lp-vsl-trafego_completa.jpg" "$dest\work-pam.jpg" 900 "jpg" 80
Convert-Img "$dl\Frame 1707479067.png" "$dest\work-agora.jpg" 900 "jpg" 80
Convert-Img "$dl\lp candy4fit.png" "$dest\work-candy.jpg" 900 "jpg" 80

# ATENCAO: o print original do PAM tem ~470px de espaco vazio no topo antes do
# conteudo. Apos gerar work-pam.jpg acima, recorte esse topo (senao a capa da
# galeria mostra so espaco em branco):
#   $src=[System.Drawing.Image]::FromFile("$dest\work-pam.jpg"); $cropTop=470
#   $nh=$src.Height-$cropTop
#   $bmp=New-Object System.Drawing.Bitmap $src.Width,$nh
#   $g=[System.Drawing.Graphics]::FromImage($bmp)
#   $g.DrawImage($src,(New-Object System.Drawing.Rectangle 0,0,$src.Width,$nh),(New-Object System.Drawing.Rectangle 0,$cropTop,$src.Width,$nh),[System.Drawing.GraphicsUnit]::Pixel)
#   $g.Dispose(); $src.Dispose()
#   $codec=[System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders()|Where-Object{$_.MimeType -eq "image/jpeg"}
#   $ep=New-Object System.Drawing.Imaging.EncoderParameters 1
#   $ep.Param[0]=New-Object System.Drawing.Imaging.EncoderParameter ([System.Drawing.Imaging.Encoder]::Quality),([long]80)
#   $bmp.Save("$dest\work-pam.jpg",$codec,$ep); $bmp.Dispose()

# --- Pecas de campanha (criativos, banners, capas) ---
Convert-Img "$dl\PAM MF - VSL - banner mobile checkout hotmart.png"   "$dest\pc-pam-hero.jpg"      700 "jpg" 80
Convert-Img "$dl\BANNER YOUTUBE - MF Autoridade Magnética (1).png"    "$dest\pc-pam-revelado.jpg" 1000 "jpg" 80
Convert-Img "$dl\banner google formulário.png"                        "$dest\pc-pam-ficha.jpg"     900 "jpg" 80
Convert-Img "$dl\Banner EMAIL.png"                                    "$dest\pc-pam-email.jpg"     900 "jpg" 80
Convert-Img "$dl\AVATAR WHATSAPP - Protocolo Autoridade magnética.png" "$dest\pc-pam-avatar.jpg"   520 "jpg" 80
Convert-Img "$dl\CAPA PRODUTO MF - AUTORIDADE MAGNÉTICA.png"          "$dest\pc-pam-capa.jpg"      380 "jpg" 80
Convert-Img "$dl\iamgem bio Vitor.png"                                "$dest\pc-pam-bio.jpg"       400 "jpg" 80
Convert-Img "$dl\MF_VSL_IMG0011_Remkt_Promessa - story.png"           "$dest\pc-pam-story.jpg"     320 "jpg" 80
Convert-Img "$dl\MF_VSL_IMG0007_L4_Conduzir_Conversa - feed.png"      "$dest\pc-pam-feed.jpg"      440 "jpg" 80
Convert-Img "$dl\ITG- banner mobile checkout hotmart.png"             "$dest\pc-itg-checkout.jpg"  700 "jpg" 80
Convert-Img "$dl\ITG- banner desktop checkout hotmart.png"            "$dest\pc-itg-desktop.jpg"   800 "jpg" 80

# --- ITG T39: segunda leva de criativos (avatar, feed, YouTube, checkout) ---
Convert-Img "$dl\avatar T39 italianità.png"                                "$dest\pc-itg2-avatar.jpg"      480 "jpg" 80
Convert-Img "$dl\Post Giulia.png"                                          "$dest\pc-itg2-livro.jpg"       620 "jpg" 80
Convert-Img "$dl\ITG T39 - Inscrições abertas.png"                         "$dest\pc-itg2-inscricoes.jpg"  620 "jpg" 80
Convert-Img "$dl\SA_ITG_LE_Capt_IMG_Junho2026_Método_Exclusivo - feed.png" "$dest\pc-itg2-cafe.jpg"        620 "jpg" 80
Convert-Img "$dl\SA_ITG_T39_Capt_IMG_Garçom_Comer_Bem - feed.png"          "$dest\pc-itg2-garcom.jpg"      620 "jpg" 80
Convert-Img "$dl\SA_ITG_T39_Capt_IMG_Minicurso_Italiano - feed.png"        "$dest\pc-itg2-minicurso.jpg"   620 "jpg" 80
Convert-Img "$dl\SA_ITG_T39_Capt_IMG_+100mil_Brasileiros - feed.png"       "$dest\pc-itg2-100mil.jpg"      620 "jpg" 80
Convert-Img "$dl\capa youtube italianita.png"                              "$dest\pc-itg2-youtube.jpg"     900 "jpg" 80
Convert-Img "$dl\t39 - banner desktop checkout hotmart.png"                "$dest\pc-itg2-reconecte.jpg"   800 "jpg" 80

# --- Limpa os brutos ---
Remove-Item "$dest\raw-*.png" -Force -ErrorAction SilentlyContinue
Write-Host "`nOK."

# --- Novos projetos: capa por cliente (galeria de portfolio expandida) ---
Convert-Img "$dl\Otelmo.png"                        "$dest\work-otelmo.jpg"      900 "jpg" 80
Convert-Img "$dl\Celip - omega 3.png"                "$dest\work-celip-omega.jpg"     900 "jpg" 80
Convert-Img "$dl\Celip - creatina.png"                "$dest\work-celip-creatina.jpg"  900 "jpg" 80
Convert-Img "$dl\Celip - magnésio.png"                "$dest\work-celip-magnesio.jpg"  900 "jpg" 80
Convert-Img "$dl\LP - protocolo mycelip.png"          "$dest\work-celip-protocolo.jpg" 900 "jpg" 80
Convert-Img "$dl\Atacadão Maromba.png"                "$dest\work-atacadao.jpg"        900 "jpg" 80
Convert-Img "$dl\lp historias da cidade.png"          "$dest\work-historias.jpg"       900 "jpg" 80
Convert-Img "$dl\LP - LIVRO POBREZA É OPÇÃO.png"      "$dest\work-tonydiniz.jpg"       900 "jpg" 80

# --- Substitui o print do Agora e acrescenta mais pecas de campanha do ITG ---
Convert-Img "$dl\lp ágora.png"                                              "$dest\work-agora.jpg"       900 "jpg" 80
Convert-Img "$dl\23_ITG_CBI_TJUN2_DUAS_MULHERES.png"                        "$dest\pc-itg2-novelo.jpg"   700 "jpg" 82
Convert-Img "$dl\SA_CBI_LP_IMG_VOCE_TEM_FAMILIARES_NA_ITALIA_FEED.png"      "$dest\pc-itg2-familiares.jpg" 700 "jpg" 82
Convert-Img "$dl\área de membros Giulia.png"                                 "$dest\pc-itg2-destaques.jpg" 1100 "jpg" 82
