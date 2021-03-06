@testset ExtendedTestSet "hausdorff_metric" begin
    @testset ExtendedTestSet "hausdorff_metric" begin
        y1 = [1 1 1 0; 1 1 1 0; 1 1 1 0; 1 1 1 0]
        y2 = [1 1 1 0; 1 1 1 0; 1 1 1 0; 1 1 1 0]
        y = cat(y1, y2; dims=3)

        edges = find_edges(y)
        @test hausdorff_metric(edges, edges) ≈ 0
    end
    
    @testset ExtendedTestSet "hausdorff_metric" begin
        y1 = [1 1 1 0; 1 1 1 0; 1 1 1 0; 1 1 1 0]
        y2 = [1 1 1 0; 1 1 1 0; 1 1 1 0; 1 1 1 0]
        y = cat(y1, y2; dims=3)

        edges = find_edges(y)
        @test hausdorff_metric(edges, edges, 50) == (0.0, 0.0)
    end
end

@testset ExtendedTestSet "mean_hausdorff_2D" begin
    @testset ExtendedTestSet "mean_hausdorff_2D" begin
        x = [1 1 1 0; 1 1 1 0; 1 1 1 0; 1 1 1 0]
        y = [1 1 1 0; 1 1 1 0; 1 1 1 0; 1 1 1 0]
        @test mean_hausdorff_2D(x, y, Distances.Euclidean(), ImageEdgeDetection.Canny()) ≈ 0
    end
end