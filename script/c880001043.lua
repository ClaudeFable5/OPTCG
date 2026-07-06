-- AUTO-GENERATED: OP08-067 / 샬롯 푸딩
-- rules_id=OP08-067 script_id=880001043 fingerprint=684aaa8e4f2d1304119b7479dfedc2cdfc06602372d334af723b7890af483f5d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-067]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[RESTED]],
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【자신의 턴 동안】【턴 1회】자신 필드의 두웅!!이 두웅!! 덱으로 되돌려졌을 때, 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다.]],
        timings={
          [[ON_DON_RETURNED]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-067]],
    schema_version=1,
  })
end
