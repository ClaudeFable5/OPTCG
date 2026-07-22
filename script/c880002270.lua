-- AUTO-GENERATED: OP14-105 / 고르곤 세 자매
-- rules_id=OP14-105 script_id=880002270 fingerprint=8f1965d9021310841ff56ae9e01ab9763966023c5d6ad5651367a742174aa383
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-105]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[GIVE_DON]],
            per_target=true,
            player=[[YOU]],
            selector={
              count=0,
              kind=[[LEADER_OR_CHARACTER]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
          },
        },
        conditions={},
        costs={
          {
            count=3,
            filter={
              trait_any={
                [[아마존 릴리]],
                [[구사 해적단]],
              },
            },
            op=[[REVEAL_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 패에서 《아마존 릴리》나 《구사 해적단》 특징을 가진 카드 3장을 공개할 수 있다: 자신의 리더와 모든 캐릭터에 레스트 상태인 두웅!!을 1장씩까지 부여한다.]],
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
    rules_id=[[OP14-105]],
    schema_version=1,
  })
end
