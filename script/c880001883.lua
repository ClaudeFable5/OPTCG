-- AUTO-GENERATED: ST12-001 / 롤로노아 조로 & 상디
-- rules_id=ST12-001 script_id=880001883 fingerprint=22fb134f83980eade823ed290b7f71bb95c2118b134c1ef7815ffa3046387d93
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST12-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              filter={
                power_lte=7000,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_OWN_CARD_TO_HAND]],
            selector={
              count=1,
              filter={
                card_type=[[CHARACTER]],
                cost_gte=2,
              },
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【두웅!!×1】【어택 시】【턴 1회】자신의 코스트 2 이상인 캐릭터 1장을 주인의 패로 되돌릴 수 있다: 자신의 파워 7000 이하인 캐릭터를 1장까지 액티브로 한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[ST12-001]],
    schema_version=1,
  })
end
