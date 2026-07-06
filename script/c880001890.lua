-- AUTO-GENERATED: ST12-008 / 롤로노아 조로
-- rules_id=ST12-008 script_id=880001890 fingerprint=0e4a7034db46ebfd9731c0e86e15a21c87fffb67d9ad472ae2b07529ae1df149
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST12-008]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=6,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】상대의 코스트 6 이하인 캐릭터를 1장까지 레스트로 한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[ST12-008]],
    schema_version=1,
  })
end
