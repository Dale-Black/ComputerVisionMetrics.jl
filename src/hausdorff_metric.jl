"""
    hausdorff_metric(set1, set2)
    hausdorff_metric(set1, set2, p)

Given two sets of points `set1` & `set2`, compute the Hausdorff distance between the two sets.
By default the returned Hausdorff is the mean Hausdorff. If given a parameter `p`, Returns a 
tuple for the percentile of each set.

# Arguments
- set1: set of points in 2D or 3D space
- set2: set of points in 2D or 3D space
- p: percentile to be computed based on `StatsBase.percentile`
"""
function hausdorff_metric(set1, set2)
    min_euc_list_u = []
    min_euc_list_v = []

    # Loop through every point in `set1` and find its corresponding closest point to `set2`
    for points1 in set1
        euc_list_1 = []
        for points2 in set2
            euclidean_dist = euc(points1, points2)
            append!(euc_list_1, euclidean_dist)
        end
        append!(min_euc_list_u, minimum(euc_list_1))
    end

    # Loop through every point in `set2` and find its corresponding closest point to `set1`
    for points1 in set2
        euc_list_1 = []
        for points2 in set1
            euclidean_dist = euc(points1, points2)
            append!(euc_list_1, euclidean_dist)
        end
        append!(min_euc_list_v, minimum(euc_list_1))
    end

    # Take the mean of each of these points to return the mean Hausdorff distance 
    return Statistics.mean([
        Statistics.mean(min_euc_list_u), Statistics.mean(min_euc_list_v)
    ])
end

function hausdorff_metric(set1, set2, p)
    min_euc_list_u = []
    min_euc_list_v = []

    # Loop through every point in `set1` and find its corresponding closest point to `set2`
    for points1 in set1
        euc_list_1 = []
        for points2 in set2
            euclidean_dist = euc(points1, points2)
            append!(euc_list_1, euclidean_dist)
        end
        append!(min_euc_list_u, minimum(euc_list_1))
    end

    # Loop through every point in `set2` and find its corresponding closest point to `set1`
    for points1 in set2
        euc_list_1 = []
        for points2 in set1
            euclidean_dist = euc(points1, points2)
            append!(euc_list_1, euclidean_dist)
        end
        append!(min_euc_list_v, minimum(euc_list_1))
    end

    return (
        StatsBase.percentile(min_euc_list_u, p), StatsBase.percentile(min_euc_list_v, p)
    )
end

"""

    mean_hausdorff_2D(u, v, d, f)
Extract the edges of two images and then find the average Hausdorff distance along those edges.
Both arrays u and v are required to be the same size and they must be binary or boolean images.
The argument d corresponds to the distance metric used for computing. Typically, Euclidean() is
a common metric for use in Hausdorff distance computation. More options can be found in
Distances.jl. The argument `f` is the algorithm used for edge detection. More options can be 
found in ImageEdgeDetection.jl.
"""

function mean_hausdorff_2D(u, v, d, f)
    edges_1 = detect_edges(u, f)
    edges_2 = detect_edges(v, f)

    sz_1 = size(edges_1, 1)
    sz_2 = size(edges_2, 1)

    # Loop through every point on `edge_1` and find its corresponding closest point to `edge_2`
    min_u =
        minimum.([
            map(x -> evaluate(d, edges_1[i, :], edges_2[x, :]), 1:sz_2) for i in 1:sz_1
        ])

    # Loop through every point on `edge_2` and find its corresponding closest point to `edge_1`
    min_v =
        minimum.([
            map(x -> evaluate(d, edges_2[i, :], edges_1[x, :]), 1:sz_1) for i in 1:sz_2
        ])

    # Take the average of each of these points to return the average Hausdorff distance 
    return mean([mean(min_u), mean(min_v)])
end
