### A Pluto.jl notebook ###
# v0.19.26

#> [frontmatter]
#> title = "ComputerVisionMetrics"
#> sidebar = "false"

using Markdown
using InteractiveUtils

# ╔═╡ 487ea05f-75d6-49b3-9845-73d29d6b0495
using HypertextLiteral

# ╔═╡ de44e159-3a61-440d-8db1-0004be55ef97
html"""
<head>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Alegreya+Sans:ital,wght@0,400;0,700;1,400&family=Vollkorn:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/daisyui@3.7.4/dist/full.css" rel="stylesheet" type="text/css" />
	<script src="https://cdn.tailwindcss.com"></script>
</head>

<div class="bg-transparent dark:bg-[#1f1f1f]">
	<div id="ComputerVisionMetricsHeader" class="flex justify-center items-center">
		<div class="header card bg-[#ADD8E6] text-center w-full">
			<div class="card-body flex flex-col justify-center items-center">
				<div>
				<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" 
				 width="150px" height="150px" viewBox="0 0 32 32" enable-background="new 0 0 32 32" xml:space="preserve"> <!-- Adjusted here -->
				<g>
					<!-- ... rest of the SVG content ... -->
					<path fill="#808184" d="M25.492,1.171c-0.609-0.61-1.674-0.61-2.283,0l-3.557,3.557L4.269,20.111
						c-0.053,0.052-0.093,0.116-0.118,0.186L0.331,31.03c-0.064,0.182-0.019,0.385,0.118,0.521c0.095,0.095,0.223,0.146,0.354,0.146
						c0.056,0,0.113-0.009,0.167-0.028l10.733-3.82c0.004-0.002,0.007-0.006,0.011-0.008c0.065-0.025,0.126-0.061,0.175-0.111
						L27.05,12.57l0,0l0.044-0.044l0.178-0.178l0,0l3.557-3.557c0.305-0.305,0.473-0.71,0.473-1.142s-0.168-0.837-0.473-1.142
						L25.492,1.171z M11.447,26.759c-3.785-1.995-5.525-4.771-6.099-5.899c-0.056-0.11-0.099-0.2-0.136-0.279L20.005,5.788l6.207,6.207
						L11.447,26.759z M4.696,21.749c0.746,1.31,2.43,3.676,5.613,5.535l-8.683,3.09L4.696,21.749z M30.122,8.084l-3.203,3.204
						l-6.206-6.206l3.204-3.203c0.232-0.232,0.637-0.232,0.869,0l5.337,5.337c0.116,0.116,0.18,0.271,0.18,0.435
						S30.238,7.968,30.122,8.084z"/>
					<path fill="#808184" d="M20.653,8.504c-0.195-0.195-0.512-0.195-0.707,0l-12.22,12.22c-0.195,0.195-0.195,0.512,0,0.707
						c0.098,0.098,0.226,0.146,0.354,0.146s0.256-0.049,0.354-0.146l12.22-12.22C20.848,9.016,20.848,8.7,20.653,8.504z"/>
					<path fill="#808184" d="M23.7,11.15c-0.195-0.195-0.512-0.195-0.707,0L10.576,23.567c-0.195,0.195-0.195,0.512,0,0.707
						c0.098,0.098,0.226,0.146,0.354,0.146s0.256-0.049,0.354-0.146L23.7,11.857C23.896,11.662,23.896,11.345,23.7,11.15z"/>
					<path fill="#808184" d="M7.607,0.447c-0.596-0.596-1.564-0.597-2.16,0l-5,5c-0.596,0.595-0.596,1.564,0,2.16l6.66,6.66
						c0.098,0.098,0.226,0.146,0.354,0.146s0.256-0.049,0.354-0.146c0.195-0.195,0.195-0.512,0-0.707L6.11,11.855L9.285,8.68
						c0.195-0.195,0.195-0.512,0-0.707s-0.512-0.195-0.707,0l-3.175,3.175L3.686,9.432l1.757-1.758c0.195-0.195,0.195-0.512,0-0.707
						s-0.512-0.195-0.707,0L2.979,8.725L1.154,6.9c-0.206-0.206-0.206-0.54,0-0.746l5-5c0.207-0.205,0.54-0.204,0.746,0l6.661,6.661
						c0.195,0.195,0.512,0.195,0.707,0s0.195-0.512,0-0.707L7.607,0.447z"/>
					<path fill="#808184" d="M24.893,17.733c-0.195-0.195-0.512-0.195-0.707,0s-0.195,0.512,0,0.707l6.66,6.66
						c0.206,0.206,0.206,0.54,0,0.746l-5,5c-0.206,0.206-0.539,0.205-0.746,0l-1.637-1.637l3.175-3.175c0.195-0.195,0.195-0.512,0-0.707
						s-0.512-0.195-0.707,0l-3.175,3.175l-1.716-1.716l1.758-1.758c0.195-0.195,0.195-0.512,0-0.707s-0.512-0.195-0.707,0l-1.758,1.758
						l-1.893-1.893c-0.195-0.195-0.512-0.195-0.707,0s-0.195,0.512,0,0.707l6.66,6.66C24.691,31.851,25.082,32,25.473,32
						c0.391,0,0.782-0.149,1.08-0.447l5-5c0.596-0.595,0.596-1.564,0-2.16L24.893,17.733z"/>
				</g>
				</svg>
				</div>
				<h1 class="card-title text-5xl font-serif">Computer Vision Metrics</h1>
				<p class="card-text text-lg font-serif">Common Metrics for Evaluating Segmentation Tasks</p>
			</div>
		</div>
	</div>
</div>
"""

# ╔═╡ dea10035-3eb5-41f1-b2cc-694237f5f1f3
struct Article
	title::String
	path::String
	image_url::String
end

# ╔═╡ ef1d1605-0725-473f-9967-e087379b9b64
article_list = Article[
	Article("Getting Started", "getting_started.jl", "https://images.unsplash.com/photo-1513542789411-b6a5d4f31634?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2574&q=80"),
	Article("API", "api.jl", "https://images.unsplash.com/photo-1503789146722-cf137a3c0fea?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2562&q=80"),
];

# ╔═╡ c36e45ca-3aab-41ff-8c80-0fb4f9ed9c36
function ArticleTile(article)
	@htl("""
	<a href="$(article.path)" class="card bordered hover:shadow-lg" style="border-color: #ADD8E6;">
		<div class="card-body">
			<h2 class="card-title">$(article.title)</h2>
			<p>Click to open the notebook.</p>
		</div>
		<figure>
			<img src="$(article.image_url)" alt="$(article.title)">
		</figure>
	</a>
	""")
end;

# ╔═╡ 7bc9b327-7b84-4a32-aa4f-07cf36eaac7d
@htl("""
<div class="grid grid-cols-2 gap-4">
	$([ArticleTile(article) for article in article_list])
</div>
""")

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
HypertextLiteral = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"

[compat]
HypertextLiteral = "~0.9.4"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.3"
manifest_format = "2.0"
project_hash = "fc304fba520d81fb78ea25b98f5762b4591b1182"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

[[deps.Tricks]]
git-tree-sha1 = "aadb748be58b492045b4f56166b5188aa63ce549"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.7"
"""

# ╔═╡ Cell order:
# ╟─de44e159-3a61-440d-8db1-0004be55ef97
# ╟─7bc9b327-7b84-4a32-aa4f-07cf36eaac7d
# ╟─ef1d1605-0725-473f-9967-e087379b9b64
# ╟─487ea05f-75d6-49b3-9845-73d29d6b0495
# ╟─dea10035-3eb5-41f1-b2cc-694237f5f1f3
# ╟─c36e45ca-3aab-41ff-8c80-0fb4f9ed9c36
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
