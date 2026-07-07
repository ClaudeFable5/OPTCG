-- AUTO-GENERATED: P-001 / 몽키 D. 루피
-- rules_id=P-001 script_id=880002005 fingerprint=54a4c154720b8cda3e72931a3150e119ffc1167ebe17aaa119e3aff9c19d8329
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            keyword=[[RUSH]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=2,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×2】이 캐릭터는 【속공】을 얻는다.
(이 카드는 등장한 턴에 어택할 수 있다)]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[P-001]],
    schema_version=1,
  })
end
