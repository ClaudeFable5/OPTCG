-- AUTO-GENERATED: OP14-114 / 란
-- rules_id=OP14-114 script_id=880002279 fingerprint=3de92d7d628a44a74a48f84bb068b5cf598157ad1e39cf35d6bd69c00e95df59
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-114]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              filter={
                trait=[[구사 해적단]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 《구사 해적단》 특징을 가진 리더 또는 캐릭터 1장에 레스트 상태인 두웅!! 1장까지를 부여한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[구사 해적단]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 리더가 《구사 해적단》 특징을 가진 경우, 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-114]],
    schema_version=1,
  })
end
