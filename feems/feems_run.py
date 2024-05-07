# base
import numpy as np
import pkg_resources
from sklearn.impute import SimpleImputer
from pandas_plink import read_plink

# viz
import matplotlib.pyplot as plt
import cartopy.crs as ccrs

# feems
from feems.utils import prepare_graph_inputs
from feems import SpatialGraph, Viz

# change matplotlib fonts
plt.rcParams["font.family"] = "Arial"
plt.rcParams["font.sans-serif"] = "Arial"

data_path = pkg_resources.resource_filename("feems", "data/")

# read the genotype data and mean impute missing data
(bim, fam, G) = read_plink("/data/home/gabriele/feems/gab_superscaffold_heterozygosity_filtered_ID".format(data_path))
imp = SimpleImputer(missing_values=np.nan, strategy="mean")
genotypes = imp.fit_transform((np.array(G)).T)

print("n_samples={}, n_snps={}".format(genotypes.shape[0], genotypes.shape[1]))


# setup graph
coord = np.loadtxt("/data/home/gabriele/feems/enlarged.coord".format(data_path))  # sample coordinates
outer = np.loadtxt("/data/home/gabriele/feems/enlarged.outer".format(data_path))  # outer coordinates
grid_path = "/data/home/gabriele/feems/res8.shp".format(data_path)  # path to discrete global grid

# graph input files
outer, edges, grid, _ = prepare_graph_inputs(coord=coord, 
                                             ggrid=grid_path,
                                             translated=True, 
                                             buffer=0,
                                             outer=outer)
											
											
sp_graph = SpatialGraph(genotypes, coord, grid, edges, scale_snps=True)
projection = ccrs.EquidistantConic(central_longitude=-115.8, central_latitude=51.17)


filename = 'plain.svg'


fig = plt.figure(dpi=300)
ax = fig.add_subplot(1, 1, 1, projection=projection)  
v = Viz(ax, sp_graph, projection=projection, edge_width=.5, 
        edge_alpha=1, edge_zorder=100, sample_pt_size=10, 
        obs_node_size=1.5, sample_pt_color="black", 
        cbar_font_size=10)
v.draw_samples()
v.draw_edges(use_weights=False)
v.draw_obs_nodes(use_ids=False)

# Save the figure as SVG
plt.savefig(filename, format='svg')

# Close the figure to free up memory
plt.close(fig)





sp_graph.fit(lamb = 100.0)

filename_2 = 'rates.svg'

fig = plt.figure(dpi=300)
ax = fig.add_subplot(1, 1, 1, projection=projection)  
v = Viz(ax, sp_graph, projection=projection, edge_width=.5, 
        edge_alpha=1, edge_zorder=100, sample_pt_size=20, 
        obs_node_size=2.5, sample_pt_color="black", 
        cbar_font_size=5)
v.draw_edges(use_weights=True)
v.draw_obs_nodes(use_ids=False) 
v.draw_edge_colorbar()

# Save the figure as SVG
plt.savefig(filename_2, format='svg')

# Close the figure to free up memory
plt.close(fig)
