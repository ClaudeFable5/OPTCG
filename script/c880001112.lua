-- AUTO-GENERATED: OP09-017 / 와이어
-- rules_id=OP09-017 script_id=880001112 fingerprint=29722ab043352bbbc1b06bd5f8d031557b902a24c38405688bc2cd34deb2e326
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-017]],
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
        conditions={
          {
            amount=7000,
            op=[[LEADER_POWER_GTE]],
            player=[[YOU]],
          },
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[키드 해적단]],
          },
        },
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】자신의 리더가 파워 7000 이상이고 《키드 해적단》 특징을 가진 경우, 이 캐릭터는 【속공】을 얻는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-017]],
    schema_version=1,
  })
end
