-- AUTO-GENERATED: ST18-003 / 상고로
-- rules_id=ST18-003 script_id=880002089 fingerprint=afb6198a1e559a3895d8263c88eb8dc72c8cd4adf58f48d2f294394932da310a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST18-003]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            count=8,
            op=[[FIELD_DON_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【어택 시】【턴 1회】자신 필드의 두웅!!이 8장 이상인 경우, 카드를 1장 뽑는다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[ST18-003]],
    schema_version=1,
  })
end
