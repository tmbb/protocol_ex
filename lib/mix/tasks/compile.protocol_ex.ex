defmodule Mix.Tasks.Compile.ProtocolEx do
  use Mix.Task

  @spec run(OptionParser.argv) :: :ok
  def run(args) do
    config = Mix.Project.config
    # Mix.Task.run "compile", args
    {opts, _, _} = OptionParser.parse(args, switches: [verbose: :boolean])

    output = Mix.Project.consolidation_path(config)
    verbose = opts[:verbose]

    if(verbose, do: IO.puts("Consolidating ProtocolEx's project-wide..."))
    ProtocolEx.consolidate_all([output: output, verbose: verbose])
    if(verbose, do: IO.puts("Consolidating ProtocolEx's project-wide complete."))
  end

  @doc """
  Cleans up consolidated protocols.
  """
  def clean do
    config = Mix.Project.config
    File.rm_rf(Mix.Project.consolidation_path(config))
  end
end
